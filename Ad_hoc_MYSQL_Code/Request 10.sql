with cte1 as (
select division, product_code, CONCAT(product, ' (',variant, ')') as product, sum(sold_quantity) as
total_sold_quantity
from gross_sales
where fiscal_year = 2021
group by division,product_code,product, variant
),
cte2 as (
select *, dense_rank() over(partition by division order by total_sold_quantity desc) 
as rank_order
from cte1
)
select * from cte2 
where rank_order <=3;


