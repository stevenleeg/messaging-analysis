SELECT 
    DISTINCT operating_system, 
    COUNT(operating_system) 
FROM 
    responses 
WHERE
    origin_country != 'United States'
GROUP BY 
    operating_system;
