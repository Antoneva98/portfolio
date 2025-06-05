Here’s a step-by-step breakdown of the SQL query

⸻

1. session_info
 WITH session_info AS (
  SELECT  
    s.date,
    s.ga_session_id,
    sp.country,
    sp.device,
    sp.continent,
    sp.channel,
    ab.test,
    ab.test_group
  FROM `ab_test` ab
  JOIN `session` s ON ab.ga_session_id = s.ga_session_id
  JOIN `session_params` sp ON sp.ga_session_id = ab.ga_session_id
)
What it does:
	•	This is the base dataset containing all sessions that participated in an A/B test.
	•	For each session, it captures:
	•	date of the session
	•	country, device, continent, channel — user metadata
	•	test and test_group — which A/B test and which variant the session belongs to.

2. session_with_orders
   session_with_orders AS (
  SELECT 
    ...
    COUNT(DISTINCT o.ga_session_id) AS session_with_orders
  FROM `order` o 
  JOIN session_info ON o.ga_session_id = session_info.ga_session_id
  GROUP BY ...
)
What it calculates:
	•	The number of sessions that resulted in orders.
	•	Grouped by test, device, country, etc., it allows for conversion rate tracking by cohort.

3. events
   events AS (
  SELECT 
    ...
    sp.event_name,
    COUNT(sp.ga_session_id) AS event_cnt
  FROM `event_params` sp
  JOIN session_info ON sp.ga_session_id = session_info.ga_session_id
  GROUP BY ...
)
What it calculates:
	•	Event count (e.g., scroll, click, view_product) for all sessions in the A/B test.
	•	Helps understand user behavior inside the session.

4. session
   session AS (
  SELECT 
    ...
    COUNT(DISTINCT session_info.ga_session_id) AS session_cnt
  FROM session_info
  GROUP BY ...
)
What it calculates:
	•	Total number of unique sessions (i.e., user visits).
	•	This is the baseline traffic volume metric.

⸻

5. account
   account AS (
  SELECT
    ...
    COUNT(DISTINCT acs.ga_session_id) AS new_account_cnt
  FROM `account_session` acs 
  JOIN session_info ON acs.ga_session_id = session_info.ga_session_id
  GROUP BY ...
)
What it calculates:
	•	Number of new accounts created during test sessions.
	•	Indicates the effectiveness of tests in driving signups.

⸻

Final Output (UNION of all)
SELECT ... FROM session_with_orders
UNION ALL
SELECT ... FROM events
UNION ALL
SELECT ... FROM session
UNION ALL
SELECT ... FROM account
		•	Combines all KPIs into a long-format table with the following structure
 date | contry | device | continent | channel | test | test-group | event_name | value
