# 📊 Ecommerce Sales & Financial Analysis (Power BI + SQL)

This project presents an **end-to-end financial and business analytics solution** built using **Power BI, SQL, and financial modeling concepts**, based on the **Online Retail Dataset (Kaggle)**.

The objective is to transform raw transactional data into **finance-grade insights**, including **Revenue Analysis, Income Statement (P&L), Balance Sheet**, forecasting, and **A/B testing**, similar to real-world tasks in **Finance Data Analyst / FP&A / Business Analyst** roles.

---

## 🔍 Dataset

- **Source:** Kaggle – Online Retail Dataset  
- **Description:** Transaction-level e-commerce data containing invoices, products, quantities, prices, customers, dates, and countries  
- **Time period:** 2009–2011  
- **Preparation:** Cleaned and transformed using SQL and Power BI  

---

## 🛠 Tools & Technologies

- **Power BI**
  - DAX measures & time intelligence
  - Financial dashboards
  - Data modeling (star schema)
- **SQL (PostgreSQL)**
  - Views for revenue, currency conversion, forecasting features
- **Python**
  - Data preprocessing & CSV conversion
- **Docker**
  - PostgreSQL environment
- **Financial Modeling**
  - P&L, Balance Sheet, KPIs

---

## 📈 Dashboards Overview

### 1️⃣ Revenue Insights

The **Revenue Insights** dashboard provides a time-based analysis of sales performance, focusing on trends, volatility, and product contribution.

### Key Analyses

**1. Total Sales by Month**
- Monthly revenue is displayed using bar charts.
- Highlights seasonality and fluctuations in customer demand.
- Enables quick identification of high-performing and weak periods.

**2. Rolling Average Sales (3-Month)**
- A 3-month rolling average is overlaid as a line chart.
- Smooths short-term volatility to reveal the underlying sales trend.
- Useful for monitoring momentum and early trend changes.

**3. Previous Month Sales Comparison**
- Compares current month revenue with the previous month.
- Supports short-term performance evaluation and month-over-month analysis.

**4. Revenue by Product**
- Ranks products based on total revenue contribution.
- Identifies key revenue drivers and long-tail products.
- Supports product portfolio and pricing decisions.

**5. Key Performance Indicators**
- Total Sales
- Total Profit
- Average Profit Margin

**6. Transaction-Level Detail**
- Detailed table including invoice date, country, product, revenue, profit, and profit margin.
- Enables drill-down analysis from aggregated trends to individual transactions.

### Business Value
This dashboard supports:
- Sales trend monitoring
- Short-term performance comparison
- Product-level revenue optimization
- Data-driven commercial decision-making

---

### 2️⃣ Income Statement (P&L)

The **Income Statement** dashboard provides a finance-focused view of company performance, following standard **Profit & Loss (P&L)** reporting structure used by finance and controlling teams.

### Key Analyses

**1. Revenue by Country**
- Displays the geographic distribution of revenue.
- Highlights core markets and revenue concentration by country.
- Supports regional performance evaluation.

**2. Expenses vs Revenue**
- Compares total expenses against total revenue for the selected year.
- Provides a quick assessment of cost structure and operational efficiency.

**3. Revenue by Month**
- Shows monthly revenue trends for the selected year.
- Helps identify seasonality and revenue stability over time.

**4. Income Statement Walk (Revenue → EBIT)**
- Waterfall chart illustrating the step-by-step transition from:
  - Revenue
  - COGS
  - Gross Margin
  - Operating Expenses (OPEX)
  - EBIT
- Clearly explains how costs impact profitability.

**5. Year-over-Year Performance (TY vs PY)**
- Table comparing:
  - Selected Year Actuals
  - Previous Year Actuals
  - Absolute variance
  - Percentage variance
- Enables performance tracking and trend analysis across years.

**6. Revenue by Time Dimensions**
- Revenue breakdown by:
  - Month
  - Quarter
- Supports high-level reporting and management summaries.

### Key Financial Metrics
- Revenue
- Cost of Goods Sold (COGS)
- Gross Profit
- Operating Expenses (OPEX)
- EBIT
- Year-over-Year growth (%)

### Business Value
This dashboard supports:
- Financial performance monitoring
- Profitability analysis
- Cost control assessment
- Geographic and temporal revenue evaluation
- Management and stakeholder reporting 

---

### 3️⃣ Balance Sheet

The **Balance Sheet** dashboard presents a structured view of the company’s financial position, following standard balance sheet logic used in finance and accounting.

### Key Analyses

**1. Total Assets and Total Liabilities**
- Displays aggregated asset and liability values for the selected year.
- Provides a high-level overview of financial strength and leverage.

**2. Asset Composition**
- Breakdown of total assets into:
  - Cash
  - Accounts Receivable (AR)
  - Inventory
- Visualized using donut charts to show relative contribution of each asset type.
- Supports liquidity and working capital analysis.

**3. Liability Structure**
- Separation of liabilities into:
  - Current Liabilities
  - Long-term Liabilities
- Enables evaluation of short-term obligations versus long-term financial commitments.

**4. Accounts Receivable (AR) Aging Analysis**
- AR amounts categorized into aging buckets:
  - 0–30 days  
  - 31–60 days  
  - 61–90 days  
  - 90+ days  
  - Not Due
- Displayed by country to assess customer payment behavior and credit risk.
- Supports cash flow management and collections prioritization.

**5. Asset and Liability Waterfall Analysis**
- Waterfall charts showing how individual asset and liability components contribute to total values.
- Helps explain changes in financial position in a clear, step-by-step manner.

### Financial Logic
- Assets and liabilities are derived from transactional sales data.
- Liabilities are simulated as a proportion of operational costs (COGS) to reflect realistic financial structure.
- AR values are based on invoiced revenue and payment aging logic.

### Business Value
This dashboard supports:
- Liquidity assessment
- Credit risk monitoring
- Working capital analysis
- Financial position reporting
- Management and stakeholder review

---

## 📊 Revenue Overview & Forecasting

This dashboard provides a comprehensive commercial and financial analysis of revenue performance across time, geography, and products.

### Key Analyses

### 1. Revenue KPIs
- **Total Revenue (Local Currency)**: Revenue aggregated in original transaction currencies.
- **Total Revenue (EUR)**: Revenue converted to EUR for consistent financial reporting.
- Enables cross-country and consolidated financial analysis.

### 2. Revenue by Country
- Bar chart highlighting top revenue-generating countries.
- Identifies market concentration and key geographic contributors.

### 3. Invoice Distribution by Country
- Geographic map visualizing invoice activity worldwide.
- Provides insight into international sales coverage and regional demand.

### 4. Sales Growth Trend
- Time-series visualization of revenue growth.
- Highlights long-term trends, seasonality, and demand fluctuations.

### 5. Revenue Forecasting
Two forecasting approaches are included:

**a) Power BI Forecast**
- Built-in time-series forecast based on historical monthly revenue.
- Used for short-term revenue outlook and trend continuation.

**b) Machine Learning Forecast**
- Prophet-based model for monthly revenue prediction.
- Includes confidence intervals to reflect forecast uncertainty.
- Demonstrates applied predictive analytics in a finance context.

### 6. Transaction-Level Detail
- Drill-down table with:
  - Country
  - Product description
  - Invoice date
  - Price
  - Revenue
  - Currency
- Ensures traceability from KPIs to individual transactions.

### Business Value
This dashboard supports:
- Financial performance monitoring
- Revenue trend analysis
- Geographic market evaluation
- Forecast-driven planning
- Executive-level financial reporting
  
---

## 🧮 Data Model & Architecture

- Star schema with a dedicated **Date Dimension**
- Fact table built using SQL views
- Currency normalization handled in SQL
- Time intelligence implemented in DAX
- Monthly and yearly aggregation supported

---

## 🧠 Skills Demonstrated

- Financial reporting (P&L, Balance Sheet)
- KPI definition and interpretation
- Time-series analysis & rolling averages
- DAX measures and debugging
- SQL data transformation
- Business storytelling with dashboards
- A/B testing and pricing analysis

---

## 🎯 Use Case

This project reflects real-world responsibilities of:
- Finance Data Analysts
- FP&A Analysts
- Business Analysts
- Controlling / Reporting Analysts

It demonstrates the ability to **bridge raw data with financial decision-making**, not just create visuals.

---

## 📂 Repository Structure

- screenshots/  
  Dashboard images used in the README

- PowerBI/  
  Power BI report file (.pbix)

- SQL/  
  SQL views and transformations used to build the analytics layer

- docker-compose.yml  
  PostgreSQL setup for running the database locally

- convert_to_csv.py  
  Data preparation script (Kaggle dataset → clean CSV)

- README.md  
  Project documentation

---

## 👤 Author

**Elnazossadat Hosseininia**  
Email: elnaz.hnia@gmail.com

Finance & Data Analytics  
Power BI | SQL | Financial Modeling  

---

⭐This project demonstrates my ability to translate raw transactional data into finance-ready insights, executive dashboards, and forward-looking revenue analysis suitable for real-world business decision-making.


