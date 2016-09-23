SELECT
    client_usages.service,
    SUM(client_usages.usage) AS points
FROM responses
JOIN client_usages ON
    responses.id = client_usages.response_id
GROUP BY client_usages.service
ORDER BY points DESC;
