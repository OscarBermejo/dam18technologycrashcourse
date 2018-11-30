SELECT difference, COUNT (user_id)
FROM (
	SELECT user_id, transaction_timestamp,
	MIN(transaction_timestamp) OVER(PARTITION BY user_id) AS first_trans ,
	(transaction_timestamp - first_trans) AS time_difference , 
	EXTRACT(DAY FROM time_difference) AS difference
	FROM tangarana.payment_transactions
	WHERE transaction_timestamp >= '2017-01-01' AND transaction_timestamp < '2017-07-01'
	ORDER BY user_id)
WHERE time_difference != '00:00:00'
GROUP BY difference
ORDER BY difference
LIMIT 10;



SELECT date_diff('day' , first_trans , transaction_timestamp ) AS difference , COUNT(user_id)
FROM (
	SELECT user_id , 
	first_value(transaction_timestamp) over (partition by user_id ) as first_trans ,
	transaction_timestamp ,
	COUNT(user_id) OVER(PARTITION BY user_id) AS count_user
	FROM tangarana.payment_transactions
	WHERE transaction_timestamp >= '2017-01-01' AND transaction_timestamp < '2017-07-01'
	AND transaction_type = 'payment' AND transaction_status = 1
	ORDER BY user_id)
WHERE count_user > 1 --AND date_diff('MINUTE' , transaction_timestamp , first_trans) > 0
GROUP BY 1
ORDER BY 1 ASC;