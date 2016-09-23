SELECT
    client_usages.service,
    COUNT(client_usages.response_id) AS install_count
FROM responses
JOIN client_usages ON
    responses.id = client_usages.response_id
WHERE 
    usage = 2 AND
    responses.origin_country != 'United States'
GROUP BY client_usages.service
ORDER BY install_count DESC;
