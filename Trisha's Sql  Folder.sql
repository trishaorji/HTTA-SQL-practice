
------------------------------------------------------------------
-- Trend or orders vs the overal average order value
SELECT id, total,(SELECT avg(total)
                  FROM orders)       
FROM orders	
GROUP BY id, total;
-----------------------------------------------------------
--identify names of clients that have placed an order
--SUBQUERY IN where function

SELECT name
FROM accounts
WHERE id IN (SELECT account_id
              FROM orders)

-----------------------------------------------------------

--Generate the order ids and when they occurred of standard papers that are greater than 500
--SUBQUERY IN THE FROM clause
SELECT id, occured_at
FROM  (SELECT id, occurred_at,standard_qty
       FROM orders
       WHERE standard_qty > 500) AS standard_above500

-------------------------------------------------------------------------------
-- CTE	   
WITH standard_above500 AS (SELECT id, occurred_at,standard_qty
       FROM orders
       WHERE standard_qty > 500)
	   
SELECT id, occurred_at
FROM standard_above
	   
---------------------------------------------------------------------------------	   

SELECT DISTINCT channel, COUNT(channel)
FROM web_events
GROUP BY channel

SELECT DISTINCT occurred_at
FROM web_events


SELECT DISTINCT occurred_at, COUNT(channel)
FROM web_events
GROUP BY occurred_at


SELECT occurred_at, DATE_TRUNC('year', occurred_at) AS years,
                    DATE_TRUNC('day', occurred_at)AS DAYS,
					DATE_TRUNC('month', occurred_at)AS Months
FROM web_events

-------------------------------------------------------------------------------------------------
SELECT date_trunc('month', occurred_at) AS month
FROM web_events;

--------------------------------------------------------------------
SELECT date_trunc('year', occurred_at) AS year
FROM web_events;

------------------------------------------------------------
SELECT DATE_TRUNC('month', occurred_at), COUNT(occurred_at)
FROM web_events
GROUP BY 1
ORDER BY 2
--------------------------------------------------------------------
SELECT DATE_PART('month', occurred_at), COUNT(occurred_at)
FROM web_events
GROUP BY 1
ORDER BY 2
-----------------------------------------------------------------
SELECT DATE_PART('dow', occurred_at), COUNT(occurred_at)
FROM web_events
GROUP BY 1
ORDER BY 1
------------------------------------------------------------------
-- DATE PART
SELECT occurred_at, DATE_PART('year', occurred_at) AS year_part,
                    DATE_PART('month', occurred_at) AS month_part,
                    DATE_PART('day', occurred_at) AS day_part
FROM web_events					
-------------------------------------------------------------------------------

SELECT DATE_PART('year', occurred_at) diff_years, SUM(total_amt_usd)
total_amt
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

------------------------------------------------------------------

--What is the total amount generated monthly since inception of parch and posey
SELECT DATE_TRUNC ('month', occurred_at)AS Month, SUM (total_amt_usd) AS monthly_sales			
FROM orders							   
GROUP BY 1
ORDER BY 1

-----------------------------------------------------
-- what month had the highest sales irrespective of the year

SELECT DATE_PART('month', occurred_at), SUM(total)
FROM orders
GROUP BY 1
ORDER BY 1 DESC;




