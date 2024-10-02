(
    SELECT 
        f.product_code, 
        d.product, 
        f.manufacturing_cost
    FROM 
        fact_manufacturing_cost f
    JOIN 
        dim_product d ON f.product_code = d.product_code
    ORDER BY 
        manufacturing_cost DESC
    LIMIT 1
)
UNION
(
    SELECT 
        f.product_code, 
        d.product, 
        f.manufacturing_cost
    FROM 
        fact_manufacturing_cost f
    JOIN 
        dim_product d ON f.product_code = d.product_code
    ORDER BY 
        manufacturing_cost ASC
    LIMIT 1
);
