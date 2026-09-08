# Sales-Operations-Performance-Dashboard
# Sales & Operations Performance Dashboard

A data-driven business analysis project translating 3,000 retail transactions into KPIs, a live-formula dashboard, and stakeholder-ready recommendations.

## Problem
Leadership needed visibility into sales performance, delivery reliability, and customer churn exposure across regions, categories, and channels — without a single consolidated view of the data.

## What's in this project
- **`retail_sales_dataset.csv`** — 3,000 synthetic FY2025 retail orders (region, category, channel, revenue, delivery days, churn-risk flag)
- **`kpi_queries.sql`** — 8 SQL queries covering monthly revenue trend, revenue by region/category/channel, delivery delay rate by region, churn-risk revenue exposure, and month-over-month growth
- **`Sales_Ops_Dashboard.xlsx`** — an interactive dashboard workbook with:
  - Live KPI cards (Total Revenue, Total Orders, AOV, % Delayed, Avg Delivery Days) built entirely with `SUMIFS`/`COUNTIFS`/`AVERAGEIFS` formulas — no hardcoded numbers
  - Breakdown tables: revenue by region, revenue by category, delivery performance by region, revenue exposure by churn risk, monthly trend
  - 4 charts: revenue by region, monthly revenue trend, revenue share by category, % delayed by region
- **`Executive_Insight_Memo.docx`** — a one-page memo translating the dashboard into 3 findings and 3 recommendations for leadership

## Approach
1. Generated a realistic transactional dataset across 4 regions, 5 categories, 2 channels
2. Wrote SQL to compute core business KPIs
3. Rebuilt those KPIs as live formulas in Excel so the dashboard recalculates automatically as data changes
4. Visualized trends and comparisons with charts
5. Distilled the numbers into an executive memo with concrete recommendations

## Key Findings
- **South region delivery bottleneck**: 47.3% of orders delayed beyond 5 days vs. 12.6% in North
- **Category concentration**: Electronics drives ~63% of total revenue ($631.8K of ~$1.0M)
- **Churn exposure**: $151K in revenue sits with high-churn-risk customers

## Technologies / Skills Used
SQL (aggregation, window functions, KPI design) · Microsoft Excel (SUMIFS/COUNTIFS/AVERAGEIFS, pivot-style tables, charting) · Data Analysis · KPI Design & Dashboarding · Business Insight Communication · Python (pandas, NumPy — synthetic dataset generation) · Microsoft Word
