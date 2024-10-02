WITH cte1 AS (
    SELECT 
        c.channel, 
        ROUND(SUM(f.sold_quantity * fg.gross_price) / 1000000, 2) AS gross_sales_mln
    FROM 
        fact_sales_monthly f
    JOIN 
        fact_gross_price fg ON f.product_code = fg.product_code
    JOIN 
        dim_customer c ON f.customer_code = c.customer_code
    WHERE 
        f.fiscal_year = 2021
    GROUP BY 
        c.channel
),
cte2 AS (
    SELECT 
        channel, 
        gross_sales_mln, 
        SUM(gross_sales_mln) OVER () AS total_sales
    FROM 
        cte1
)
SELECT 
    channel, 
    gross_sales_mln, 
    ROUND((gross_sales_mln / total_sales) * 100, 2) AS percentage
FROM 
    cte2
ORDER BY 
    percentage DESC;
