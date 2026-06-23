# Email Engagement by Country (BigQuery)

**Business problem.** Account, session and email-event data live in separate tables, so there is no single view of where engaged users are. Marketing needs to know which countries to prioritise for email campaigns.

**Business questions.**
1. How many accounts are created per country, and how do markets compare?
2. How does the email funnel (sent → opened → visited) perform per country?
3. Which top-10 countries dominate by accounts created and by emails sent?

**Approach.**
- `account_creation` ties each account to its first session date, country and settings.
- `email_metrics` counts sent / opened / visited messages per account.
- Both are combined with `UNION ALL` and aggregated by country.
- Window functions (`SUM() OVER (PARTITION BY country)`) build country totals; `DENSE_RANK()` ranks them; the final filter keeps the top-10 by accounts or by emails sent.

**Findings.** A small set of countries concentrates most accounts and email volume, and the two rankings do not fully overlap — some markets are large by users but under-emailed.

**Next steps.**
- *Marketing:* concentrate email spend on the top markets by funnel performance, not just by account count.
- *Marketing:* investigate markets that rank high on accounts but low on emails sent — untapped reach.

Query: [`query.sql`](./query.sql)
