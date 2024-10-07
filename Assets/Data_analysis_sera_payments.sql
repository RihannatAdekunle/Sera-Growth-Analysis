--Question 1 - How many transactions occurred?

SELECT COUNT(transaction_id) AS num_of_transaction
FROM sera.sales;

-- Question 2 -	What is the period covered in the analysis?

SELECT MAX(datetime) AS end_date,MIN(datetime) AS start_date,
AGE(MAX(datetime),MIN(datetime)) AS period_covered
FROM sera.sales;

--Question 3 - Show the transaction count by status and percentage of total for each status.

WITH status_num 
AS(
SELECT COUNT(status) AS total_rows,
COUNT(CASE WHEN status LIKE 'success' THEN 1 END) AS total_success,
COUNT(CASE WHEN status LIKE 'abandoned' THEN 1 END) AS total_abandoned,
COUNT(CASE WHEN status LIKE 'failed' then 1 END) AS total_failed
FROM sera.sales)
SELECT total_success,
total_failed,
total_abandoned,
total_rows,
ROUND((total_success * 1.0 / total_rows),1) AS successful_perc,
ROUND((total_failed * 1.0 /total_rows),1) AS failed_perc,
ROUND((total_abandoned * 1.0 / total_rows),1) AS abandoned_perc
FROM status_num;

--Question 4 - Show the monthly subscription revenue split by channel.
--Assume that the exchange rate NGN/USD is 950

SELECT channel,DATE_TRUNC('MONTH', datetime) AS monthly_sub, 
ROUND(SUM(CASE WHEN currency = 'USD' THEN amount / 950 ELSE amount END),2)
	AS total_revenue
FROM sera.sales
GROUP BY channel,monthly_sub
ORDER BY total_revenue DESC;

--Question 5 - Show the total transactions by channel split by the transaction status. 
--Which channel has the highest rate of success? 
--Which has the highest rate of failure? 

SELECT channel,COUNT(status) AS total_txn,
COUNT(CASE WHEN status LIKE 'success' THEN 1 END) AS total_success,
COUNT(CASE WHEN status LIKE 'abandoned' THEN 1 END) AS total_abandoned,
COUNT(CASE WHEN status LIKE 'failed' then 1 END) AS total_failed
FROM sera.sales
GROUP  BY channel
ORDER BY total_success DESC;

--Question 6 - How many subscribers are there in total? 

SELECT COUNT(user_id) AS subscribers,status
FROM sera.sales
WHERE status = 'success'
GROUP BY status;

--Question 7 - A user is active within a month when there is an attempt to subscribe. 
--Generate a list of users showing their number of active months, total successful, abandoned and failed transactions. 

SELECT user_id,months_active,total_success,total_abandoned,total_failed
FROM (
SELECT user_id, 
COUNT(DISTINCT DATE_TRUNC('month', datetime)) AS months_active,
COUNT(CASE WHEN status LIKE 'success' THEN 1 END) AS total_success,
COUNT(CASE WHEN status LIKE 'abandoned' THEN 1 END) AS total_abandoned,
COUNT(CASE WHEN status LIKE 'failed' THEN 1 END) AS total_failed
FROM sera.sales
GROUP BY user_id
) AS Active
ORDER BY months_active DESC;

--Question -Identify the users with more than 1 active month without a successful transaction.

WITH unsuccessfull
	AS(
SELECT user_id,
COUNT(DISTINCT DATE_TRUNC('month', datetime)) AS months_active,
COUNT(CASE WHEN status LIKE 'success' THEN 1 END) AS total_success
FROM sera.sales
GROUP BY user_id
HAVING COUNT(DISTINCT DATE_TRUNC('month', datetime)) > 1
ORDER BY months_active DESC
)
SELECT user_id,months_active,total_success
FROM unsuccessfull
WHERE total_success = 0;









