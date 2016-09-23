SELECT
    client_usages.service,
    SUM(client_usages.usage) AS points
FROM responses
JOIN client_usages ON
    responses.id = client_usages.response_id
WHERE
    origin_country = 'United States'
GROUP BY client_usages.service
ORDER BY points DESC;
