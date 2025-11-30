import requests
import psycopg2
from datetime import date

# 1. Fetch live exchange rates from Frankfurter.app (ECB source)
url = "https://api.frankfurter.app/latest?from=EUR"
data = requests.get(url).json()

# 2. Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="ecommerce",
    user="admin",
    password="admin123",
    host="localhost",
    port="5432"
)
cur = conn.cursor()

# 3. Ensure the table exists
cur.execute("""
CREATE TABLE IF NOT EXISTS exchange_rates (
    id SERIAL PRIMARY KEY,
    currency_code VARCHAR(10),
    rate_to_eur NUMERIC,
    rate_date DATE DEFAULT CURRENT_DATE
)
""")

# 4. Insert new records (keep history)
print(f"⏳ Adding exchange rates with history...{data['date']}")
for code, rate in data["rates"].items():
    cur.execute("""
        INSERT INTO exchange_rates (currency_code, rate_to_eur, rate_date)
        VALUES (%s, %s, %s);
    """, (code, rate, date.today()))

conn.commit()
conn.close()
print("✅ Exchange rates added with history.")
