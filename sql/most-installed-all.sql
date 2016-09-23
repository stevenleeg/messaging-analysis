SELECT
    client_usages.service,
    COUNT(client_usages.response_id) AS install_count
FROM responses
JOIN client_usages ON
    responses.id = client_usages.response_id
WHERE usage IN (1, 2)
GROUP BY client_usages.service
ORDER BY client_usages.service;
