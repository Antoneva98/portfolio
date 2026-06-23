# A/B Test KPI Summary (BigQuery)

**Business problem.** A/B test results are scattered across several event tables (`session`, `order`, `event_params`, `account_session`). There is no single source of truth to compare test groups, so analysts cannot quickly judge which variant wins.

**Business questions.**
1. How many sessions does each test group generate, by device / country / channel?
2. How many sessions convert to orders per group?
3. Which in-session events differ between groups?
4. How many new accounts does each group drive?

**Approach.**
- `session_info` is the base table: every session in the A/B test, enriched with geo, device, channel and test group.
- Four metric CTEs build on it (`session_with_orders`, `events`, `session`, `account`) and are stitched together with `UNION ALL` into a tidy long format:
  `date | country | device | continent | channel | test | test_group | event_name | value`.
- This shape lets a BI tool pivot any KPI by any dimension without rewriting SQL, and new KPIs only need another `UNION ALL`.

**Findings.** One dataset now supports conversion, event and signup comparisons per variant — it feeds the [A/B Test Session Analysis dashboard](../../tableau/dashboards/).

**Next steps.**
- *Analytics:* use this table directly to monitor group balance and lift; confirm group sizes are balanced before declaring a winner.

Query: [`query.sql`](./query.sql) · Related dashboard: [A/B Test Session Analysis](../../tableau/dashboards/)
