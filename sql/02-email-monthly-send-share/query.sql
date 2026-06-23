-- Порахувати відсоток імейлів від загальної кількості, що було відправлено кожному акаунту в рамках кожного місяця (кількість листів, відправлених акаунту за місяць / загальну кількість листів, відправлених за місяць всім акаунтам).
-- Визначити дату першого та останнього надсилання імейлів для кожного акаунту у місяці.


SELECT DISTINCT -- загальну кількість листів, відправлених за місяць всім акаунтам
  id_account,
  sent_month,
  ROUND(COUNT(*) OVER(PARTITION BY id_account, sent_month) * 100.0 /  COUNT(*) OVER(PARTITION BY sent_month), 2) AS sent_msg_percent_from_this_month,
  MIN(DATE_ADD(date, INTERVAL sent_date DAY)) OVER(PARTITION BY id_account, sent_month) AS first_sent_date,
  MAX(DATE_ADD(date, INTERVAL sent_date DAY)) OVER(PARTITION BY id_account, sent_month) AS last_sent_date
FROM(
SELECT  
  es.id_account,
  DATE_TRUNC(DATE_ADD(s.date, INTERVAL es.sent_date DAY), MONTH) AS sent_month,
  s.date,
  sent_date
FROM `data-analytics-mate.DA.email_sent` es
JOIN `data-analytics-mate.DA.account_session` acs
ON es.id_account = acs.account_id
JOIN `data-analytics-mate.DA.session` s
USING(ga_session_id)
)   -- місяць, коли було відправлено email кожному акаунту.
ORDER BY
