with cte1 as (
select concat(monthname(date), ' (', year(date), ')') as Month, 
fs.customer_code,fs.product_code, fs.sold_quantity, fs.fiscal_year,
fg.gross_price
from fact_sales_monthly fs
join fact_gross_price fg
on fs.product_code = fg.product_code
)
select Month, 
fiscal_year, 
round(sum(sold_quantity * gross_price),2) as gross_sales_amount
from cte1
join dim_customer
on cte1.customer_code = dim_customer.customer_code
where dim_customer.customer = "Atliq Exclusive" 
group by Month, fiscal_year;