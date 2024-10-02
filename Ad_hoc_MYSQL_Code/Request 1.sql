SELECT DISTINCT 
    market 
FROM 
    dim_customer
WHERE 
    customer = 'Atliq exclusive' 
    AND region = 'APAC';
