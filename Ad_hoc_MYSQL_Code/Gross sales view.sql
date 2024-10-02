SELECT 
    fs.date, 
    fs.fiscal_year, 
    fs.customer_code, 
    d.customer,  
    d.channel, 
    d.market, 
    d.region,
    fs.product_code, 
    dp.product, 
    dp.division, 
    dp.segment, 
    dp.variant, 
    fs.sold_quantity, 
    fg.gross_price, 
    ROUND((fs.sold_quantity * fg.gross_price), 2) AS gross_sales_amount
FROM 
    fact_sales_monthly fs
JOIN 
    dim_customer d 
    ON fs.customer_code = d.customer_code
JOIN 
    dim_product dp
    ON fs.product_code = dp.product_code
JOIN 
    fact_gross_price fg
    ON fs.product_code = fg.product_code 
    AND fs.fiscal_year = fg.fiscal_year;
