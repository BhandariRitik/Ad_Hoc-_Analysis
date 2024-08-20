select fp.customer_code, d.customer, round(avg(pre_invoice_discount_pct),4) as average_discount_percentaged  
from fact_pre_invoice_deductions fp
join dim_customer d
on fp.customer_code = d.customer_code
where fiscal_year = 2021 and market  = "india"
group by fp.customer_code, d.customer
order by average_discount_percentaged desc
limit 5;
