WITH increase_in_product_by_segment AS (
    SELECT 
        d.segment, 
        COUNT(DISTINCT CASE WHEN f.fiscal_year = 2020 THEN f.product_code END) AS unique_product_2020,
        COUNT(DISTINCT CASE WHEN f.fiscal_year = 2021 THEN f.product_code END) AS unique_product_2021
    FROM 
        fact_sales_monthly f
    JOIN 
        dim_product d ON f.product_code = d.product_code
    GROUP BY 
        d.segment
)
SELECT 
    *, 
    (unique_product_2021 - unique_product_2020) AS difference 
FROM 
    increase_in_product_by_segment
ORDER BY 
    difference DESC;
