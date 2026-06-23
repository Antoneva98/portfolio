# Email Monthly Send Share (BigQuery)

**Business problem.** Email sending is uneven across accounts. The team needs to see how send volume is distributed per account per month to spot over- and under-contacted users.

**Business questions.**
1. What percentage of a month's total emails goes to each account?
2. When was the first and last email sent to each account within the month?

**Approach.**
- An inner subquery joins `email_sent → account_session → session` and derives the real send date with `DATE_ADD(date, INTERVAL sent_date DAY)`, bucketed to month with `DATE_TRUNC`.
- Window functions compute each account's monthly share: `COUNT(*) OVER (PARTITION BY id_account, sent_month) / COUNT(*) OVER (PARTITION BY sent_month)`.
- `MIN()` / `MAX()` windows return first and last send dates per account-month.

**Findings.** Email volume is concentrated — a minority of accounts receive a disproportionate share of monthly sends; the first/last gap shows how long each account stays in the sending window.

**Next steps.**
- *Marketing:* cap or rebalance frequency for the highest-share accounts to reduce unsubscribe risk.
- *Marketing / CRM:* use first/last send gaps to design re-engagement timing.

Query: [`query.sql`](./query.sql)
