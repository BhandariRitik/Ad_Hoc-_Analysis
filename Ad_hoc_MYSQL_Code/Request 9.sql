with cte1 as 
(
select c.channel, round(sum(f.sold_quantity * fg.gross_price)/1000000,2) as gross_sales_mln from
fact_sales_monthly f
join fact_gross_price fg
on f.product_code = fg.product_code
join dim_customer c
on f.customer_code = c.customer_code
where f.fiscal_year = 2021
group by channel
),
cte2 as (
select channel, gross_sales_mln, sum(gross_sales_mln) over() as total_sales
from cte1
)
select channel,gross_sales_mln, round((gross_sales_mln/total_sales)*100,2) as percentage
from cte2
order by percentage desc;
