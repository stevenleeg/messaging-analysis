require "sqlite3"
require "csv"

SERVICES = [
  'Facebook Messenger',
  'iMessage',
  'WhatsApp',
  'Telegram',
  'Slack',
  'Skype',
  'Snapchat',
  'QQ Mobile',
  'Line',
  'WeChat',
  'Viber',
  'GroupMe',
  'SMS',
  'IRC',
  'Google Talk',
]

USAGE_RESPONSES = {
  "I don't have it" => 0,
  "I have it but rarely use it" => 1,
  "I use it at least once a week" => 2,
}

INSERT_USAGE = <<-SQL
  INSERT INTO client_usages 
    (response_id, service, usage)
  VALUES
    (?, ?, ?)
SQL

INSERT_RESPONSE = <<-SQL
  INSERT INTO responses 
    (timestamp, origin_country, operating_system)
  VALUES
    (?, ?, ?)
SQL

db = SQLite3::Database.new('data.db')

CSV.foreach('./data.csv', headers: :first_row) do |row|
  db.execute(INSERT_RESPONSE, [
    row['timestamp'], 
    row['country'], 
    row['operating_system'],
  ])

  response_id = db.last_insert_row_id

  SERVICES.each do |service|
    usage = USAGE_RESPONSES[row[service]]
    db.execute(INSERT_USAGE, [
      response_id,
      service, 
      usage,
    ])
  end
end
