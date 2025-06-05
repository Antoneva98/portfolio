WITH account_creation AS (
  SELECT
    a.id AS account_id,
    MIN(s.date) AS account_date, -- мінімальна дата сесії, до якої прив’язаний акаунт
    sp.country,
    a.send_interval,
    a.is_verified,
    a.is_unsubscribed
  FROM `data-analytics-mate.DA.account` a
   JOIN `data-analytics-mate.DA.account_session` acs
  ON a.id = acs.account_id
  JOIN `data-analytics-mate.DA.session` s
  ON acs.ga_session_id = s.ga_session_id
  JOIN `data-analytics-mate.DA.session_params` sp
  ON acs.ga_session_id = sp.ga_session_id
  GROUP BY a.id, sp.country, a.send_interval, a.is_verified, a.is_unsubscribed
),




-- Метрики по акаунтам
account_metrics AS (
  SELECT
    account_date AS date,
    country,
    send_interval,
    is_verified,
    is_unsubscribed,
    COUNT(*) AS account_cnt,
    0 AS sent_msg,
    0 AS open_msg,
    0 AS visit_msg
  FROM account_creation
  GROUP BY account_date, country, send_interval, is_verified, is_unsubscribed
),




-- Метрики по емейлах
email_metrics AS (
  SELECT
    DATE_ADD(ac.account_date, INTERVAL es.sent_date DAY) AS date,
    ac.country,
    ac.send_interval,
    ac.is_verified,
    ac.is_unsubscribed,
    0 AS account_cnt,
    COUNT(DISTINCT es.id_message) AS sent_msg,
    COUNT(DISTINCT eo.id_message) AS open_msg,
    COUNT(DISTINCT ev.id_message) AS visit_msg
  FROM `data-analytics-mate.DA.email_sent` es
  JOIN account_creation ac ON es.id_account = ac.account_id
  LEFT JOIN `data-analytics-mate.DA.email_open` eo
    ON es.id_account = eo.id_account AND es.id_message = eo.id_message
  LEFT JOIN `data-analytics-mate.DA.email_visit` ev
    ON es.id_account = ev.id_account AND es.id_message = ev.id_message
  GROUP BY DATE_ADD(ac.account_date, INTERVAL es.sent_date DAY), ac.country, ac.send_interval, ac.is_verified, ac.is_unsubscribed
),




-- Юніон двох джерел
combined AS (
  SELECT * FROM account_metrics
  UNION ALL
  SELECT * FROM email_metrics
),




-- Додавання агрегацій по країні
country_aggregates AS (
  SELECT
    date,
    country,
    send_interval,
    is_verified,
    is_unsubscribed,
    SUM(account_cnt) AS account_cnt,  
    SUM(sent_msg) AS sent_msg,  
    SUM(open_msg) AS open_msg,  
    SUM(visit_msg) AS visit_msg,  
    SUM(SUM(account_cnt)) OVER (PARTITION BY country) AS total_country_account_cnt,
    SUM(SUM(sent_msg)) OVER (PARTITION BY country) AS total_country_sent_cnt
  FROM combined
  GROUP BY date, country, send_interval, is_verified, is_unsubscribed
),




-- Додавання рейтингів
final_with_ranks AS (
  SELECT *,
    DENSE_RANK() OVER (ORDER BY total_country_account_cnt DESC) AS rank_total_country_account_cnt,
    DENSE_RANK() OVER (ORDER BY total_country_sent_cnt DESC) AS rank_total_country_sent_cnt
  FROM country_aggregates)


-- Фінальний результат
SELECT *
FROM final_with_ranks
WHERE rank_total_country_account_cnt <= 10
OR rank_total_country_sent_cnt <= 10;



























