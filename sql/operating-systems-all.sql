SELECT 
    DISTINCT operating_system, 
    COUNT(operating_system) 
FROM 
    responses 
GROUP BY 
    operating_system;
