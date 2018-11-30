SELECT * FROM sql_masterclass.transactions 
WHERE user_id = 656909;

SELECT * FROM sql_masterclass.visits 
WHERE user_id = 656909;

--¡¡¡¡user_id = 656909, tiene transaction y no sale en slide!!!!


SELECT t.user_id, visit_time, transaction_time , transaction_id , visit_id ,  (transaction_time - visit_time) AS difference ,
COUNT(v.visit_time) OVER(PARTITION BY v.visit_id) AS count_visit , 
COUNT(t.transaction_time) OVER(PARTITION BY t.transaction_id) AS count_transaction ,
MIN(transaction_time - visit_time) OVER (PARTITION BY t.transaction_id) AS min_difference
FROM sql_masterclass.transactions AS t
INNER JOIN sql_masterclass.visits AS v
ON t.user_id = v.user_id
--WHERE (transaction_time - visit_time) > 0
ORDER BY t.user_id;


SELECT user_id, transaction_id, visit_id, visit_time, transaction_time
FROM (
	SELECT t.user_id, visit_time, transaction_time , transaction_id , visit_id ,  (transaction_time - visit_time) AS difference ,
	COUNT(v.visit_time) OVER(PARTITION BY v.visit_id) AS count_visit , 
	COUNT(t.transaction_time) OVER(PARTITION BY t.transaction_id) AS count_transaction ,
	MIN(transaction_time - visit_time) OVER (PARTITION BY t.transaction_id) AS min_difference
	FROM sql_masterclass.transactions AS t
	INNER JOIN sql_masterclass.visits AS v
	ON t.user_id = v.user_id
	WHERE (transaction_time - visit_time) > 0
	ORDER BY t.user_id)
WHERE difference = min_difference;