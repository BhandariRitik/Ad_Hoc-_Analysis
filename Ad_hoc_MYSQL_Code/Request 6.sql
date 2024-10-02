SELECT 
    fp.customer_code, 
    d.customer, 
    ROUND(AVG(pre_invoice_discount_pct), 4) AS average_discount_percentage  
FROM 
    fact_pre_invoice_deductions fp
JOIN 
    dim_customer d ON fp.customer_code = d.customer_code
WHERE 
    fiscal_year = 2021 
    AND market = 'india'
GROUP BY 
    fp.customer_code, 
    d.customer
ORDER BY 
    average_discount_percentage DESC
LIMIT 5;
