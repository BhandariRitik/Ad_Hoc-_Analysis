WITH cte1 AS (
    SELECT 
        division, 
        product_code, 
        CONCAT(product, ' (', variant, ')') AS product, 
        SUM(sold_quantity) AS total_sold_quantity
    FROM 
        gross_sales
    WHERE 
        fiscal_year = 2021
    GROUP BY 
        division, 
        product_code, 
        product, 
        variant
),
cte2 AS (
    SELECT 
        *, 
        DENSE_RANK() OVER (PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order
    FROM 
        cte1
)
SELECT 
    * 
FROM 
    cte2 
WHERE 
    rank_order <= 3;

