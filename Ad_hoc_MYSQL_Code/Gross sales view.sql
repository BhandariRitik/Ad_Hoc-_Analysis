
select fs.date, fs.fiscal_year, fs.customer_code, d.customer,  d.channel, d.market, d.region,
fs.product_code, dp.product, dp.division, dp.segment, dp.variant, fs.sold_quantity, fg.gross_price, 
round((fs.sold_quantity * fg.gross_price),2) as gross_sales_amount
from fact_sales_monthly fs
join dim_customer d 
on fs.customer_code = d.customer_code
join dim_product dp
on fs.product_code = dp.product_code
join fact_gross_price fg
on fs.product_code = fg.product_code and 
fs.fiscal_year = fg.fiscal_year;