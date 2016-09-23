SELECT 
    DISTINCT origin_country, 
    COUNT(origin_country) 
FROM 
    responses 
GROUP BY 
    origin_country;
