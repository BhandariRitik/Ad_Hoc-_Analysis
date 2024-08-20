(select f.product_code, d.product, f.manufacturing_cost
from fact_manufacturing_cost f
join dim_product d
on f.product_code = d.product_code
order by manufacturing_cost  desc
limit 1)
union
(select f.product_code, d.product, f.manufacturing_cost
from fact_manufacturing_cost f
join dim_product d
on f.product_code = d.product_code
order by manufacturing_cost  asc
limit 1);