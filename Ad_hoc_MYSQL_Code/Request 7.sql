WITH cte1 AS (
    SELECT 
        CONCAT(MONTHNAME(date), ' (', YEAR(date), ')') AS Month, 
        fs.customer_code,
        fs.product_code, 
        fs.sold_quantity, 
        fs.fiscal_year,
        fg.gross_price
    FROM 
        fact_sales_monthly fs
    JOIN 
        fact_gross_price fg ON fs.product_code = fg.product_code
)
SELECT 
    Month, 
    fiscal_year, 
    ROUND(SUM(sold_quantity * gross_price), 2) AS gross_sales_amount
FROM 
    cte1
JOIN 
    dim_customer ON cte1.customer_code = dim_customer.customer_code
WHERE 
    dim_customer.customer = 'Atliq Exclusive' 
GROUP BY 
    Month, 
    fiscal_year;
