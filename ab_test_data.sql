WITH session_info AS(
-- Join A/B test groups with session parameters and geography
  
SELECT 
    sess.ga_session_id,
    sess.date, 
    sespar.country, 
    sespar.device, 
    sespar.continent, 
    sespar.channel, 
    ab.test, 
    ab.test_group
FROM `data-analytics-mate.DA.ab_test` AS ab
JOIN `DA.session` AS sess
ON ab.ga_session_id = sess.ga_session_id
JOIN `DA.session_params` AS sespar
ON sess.ga_session_id = sespar.ga_session_id
), 

session_with_orders AS(
-- Calculate unique sessions with orders
  
SELECT 
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group,
    COUNT(DISTINCT ord.ga_session_id) AS session_with_ord
FROM `DA.order` AS ord
JOIN session_info AS session_info
ON ord.ga_session_id = session_info.ga_session_id
GROUP BY 
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group
),

events AS(
-- Aggregate event counts by name
  
SELECT 
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group,
    evpar.event_name,
    COUNT(evpar.ga_session_id) AS event_cnt
FROM `DA.event_params` AS evpar
JOIN session_info
ON evpar.ga_session_id = session_info.ga_session_id
GROUP BY 
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group,
    evpar.event_name
),

session AS(
-- Calculate total session count
  
SELECT
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group,
    COUNT(session_info.ga_session_id) AS session_cnt
FROM session_info
GROUP BY 
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group
),

new_account AS (
-- Calculate new account registrations
  
SELECT
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group,
    COUNT(DISTINCT acs.ga_session_id) AS new_account_cnt
FROM `DA.account_session` AS acs
JOIN session_info
ON acs.ga_session_id = session_info.ga_session_id
GROUP BY 
    session_info.date, 
    session_info.country, 
    session_info.device, 
    session_info.continent, 
    session_info.channel, 
    session_info.test, 
    session_info.test_group
)
  
-- Final union of all metrics
  
SELECT 
    session_with_orders.date, 
    session_with_orders.country, 
    session_with_orders.device, 
    session_with_orders.continent, 
    session_with_orders.channel, 
    session_with_orders.test, 
    session_with_orders.test_group,
    'session with orders' AS event_name,
    session_with_orders.session_with_ord AS value
FROM session_with_orders

UNION ALL 

SELECT 
    events.date, 
    events.country, 
    events.device, 
    events.continent, 
    events.channel, 
    events.test, 
    events.test_group,
    event_name,
    event_cnt AS value
FROM events

UNION ALL

SELECT 
    session.date, 
    session.country, 
    session.device, 
    session.continent, 
    session.channel, 
    session.test, 
    session.test_group,
    'session' AS event_name,
    session_cnt AS value
FROM session

UNION ALL

SELECT 
    new_account.date, 
    new_account.country, 
    new_account.device, 
    new_account.continent, 
    new_account.channel, 
    new_account.test, 
    new_account.test_group,
    'new account' AS event_name,
    new_account_cnt AS value
FROM new_account
