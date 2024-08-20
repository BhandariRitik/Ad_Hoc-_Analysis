with increase_in_product_by_segment as (
select d.segment, count(distinct case when f.fiscal_year = 2020 then f.product_code end) as unique_product_2020,
count(distinct case when f.fiscal_year = 2021 then f.product_code end) as unique_product_2021
from fact_sales_monthly f
join dim_product  d
on f.product_code = d.product_code
group by segment

)
select *, (unique_product_2021 - unique_product_2020) as difference 
from increase_in_product_by_segment
order by difference desc;
