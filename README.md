# Artem — Data Analyst

I turn raw data into decisions: defining the business question, finding the answer in SQL/Python, and presenting it so each team knows what to do next.

Open to Data / Product / Marketing Analyst roles.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?logo=linkedin&logoColor=white)](https://www.linkedin.com/in/antonevych/)
[![Tableau Public](https://img.shields.io/badge/Tableau%20Public-View%20dashboards-E97627?logo=tableau&logoColor=white)](https://public.tableau.com/app/profile/artem.da/vizzes)

---

## Projects

Each project starts from a business question and ends with concrete actions for specific teams — not just charts.

### Tableau dashboards
Source files in [`tableau/dashboards/`](./tableau/dashboards/); all are live on [Tableau Public](https://public.tableau.com/app/profile/artem.da/vizzes).

| Dashboard | Business question | Outcome |
|-----------|-------------------|---------|
| [NMT 2024 — Kyiv vs Vinnytsia](./tableau/dashboards/) *(test task, savED foundation)* | Which subjects do students choose for the National Multi-subject Test, and how do regions differ? | English leads both regions; Geography is far more popular in Vinnytsia (27.2% vs 19.5%) — where to focus educational support. |
| [Sales & User Behavior](./tableau/dashboards/) | Where does $31.97M revenue come from across markets, channels and browsers? | US = 44% of revenue; Organic Search is the top channel; Chrome = 68.6% of sessions. |
| [A/B Test Session Analysis](./tableau/dashboards/) | Are the test groups balanced, and which variant performs better? | Balanced 50/50; variant 2 lifts checkout intent +12% but not orders (+0.27%). |
| [Email Metrics](./tableau/dashboards/) | How healthy are our email KPIs over four months? | Open Rate 52% is strong; Click Rate 4.5% is weak — the content/CTA is the bottleneck. |
| [Sales Quality](./tableau/dashboards/) | Which products, categories and devices drive revenue? | Sofas & armchairs lead ($8.38M); desktop drives 59% of spend. |

### SQL (BigQuery)

| Project | Business question |
|---------|-------------------|
| [Email engagement by country](./sql/01-email-engagement-by-country/) | Which markets concentrate the most engaged users across the send → open → visit funnel? |
| [Email monthly send share](./sql/02-email-monthly-send-share/) | How is email volume distributed per account each month — who is over- or under-contacted? |
| [A/B test KPI summary](./sql/03-ab-test-kpi-summary/) | How do we model every test metric into one table BI can slice by group and dimension? |

### Python

| Project | Business question |
|---------|-------------------|
| [Retail performance intelligence](./python/01-retail-performance-intelligence/) | How do users move through the funnel and which products perform? |
| [Global sales analytics](./python/02-global-sales-analytics/) | Which product categories drive revenue and profit — once the data is clean? |
| [Demographic & salary analysis](./python/03-demographic-salary-analysis/) | How does salary vary across demographic groups? |
| [Sales insights (Matplotlib)](./python/04-sales-insights-matplotlib/) | How are sales distributed, how do they trend, and what drives them? |

---

## Repository structure

```
portfolio/
├── sql/        BigQuery analytical queries  (one folder + README per project)
├── python/     Jupyter / Colab notebooks    (one folder + README per project)
├── tableau/    Tableau .twbx dashboards      (also live on Tableau Public)
└── assets/     Dashboard preview screenshots
```

## How to explore

- SQL — open `query.sql` in each folder; the README states the problem, the questions and the actions per team.
- Python — notebooks render on GitHub, or open via the Colab link inside.
- Tableau — view live on Tableau Public, or open the `.twbx` in Tableau Desktop.

---

Contact: [LinkedIn](https://www.linkedin.com/in/antonevych/) · [Tableau Public](https://public.tableau.com/app/profile/artem.da/vizzes)
