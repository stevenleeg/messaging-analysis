CREATE TABLE IF NOT EXISTS responses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    timestamp TEXT,
    origin_country TEXT,
    operating_system TEXT
);

CREATE TABLE IF NOT EXISTS client_usages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    response_id INTEGER,
    service TEXT,
    usage INTEGER
);
