-- Quiz Funnel

SELECT *
FROM survey
LIMIT 10;


-- Number of responses for each question

SELECT question, COUNT (DISTINCT user_id)
FROM survey
GROUP BY question;

-- Quiz Funnel

SELECT response, COUNT(*)
FROM survey
WHERE question LIKE '1.%'
GROUP BY 1
ORDER BY 2 DESC;
SELECT response, COUNT(*)
FROM survey
WHERE question LIKE '2.%'
GROUP BY 1
ORDER BY 2 DESC;
SELECT response, COUNT(*)
FROM survey
WHERE question LIKE '3.%'
GROUP BY 1
ORDER BY 2 DESC;
SELECT response, COUNT(*)
FROM survey
WHERE question LIKE '4.%'
GROUP BY 1
ORDER BY 2 DESC;
SELECT response, COUNT(*)
FROM survey
WHERE question LIKE '5.%'
GROUP BY 1
ORDER BY 2 DESC;
-------------
SELECT s.user_id, h.user_id 
FROM survey AS 's’
LEFT JOIN home_try_on AS 'h'
 on s.user_id = h.user_id
 where s.question like '1%’ 
 AND response like '%skip it%';


SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;


WITH funnel AS(
SELECT DISTINCT q.user_id,
	  h.user_id IS NOT NULL AS 'is_home_try_on',
               h.number_of_pairs,
               p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
		 ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
		 ON p.user_id = q.user_id)
SELECT COUNT (*) AS 'num_quiz',
		 SUM(is_home_try_on) AS 'num_HTO',
     SUM(is_purchase) AS 'num_purchase',
	1.0 * SUM(is_home_try_on)/ COUNT(user_id) AS 'quiz to HTO',
  1.0 * SUM(is_purchase)/ SUM(is_home_try_on) AS 'HTO to purchase'
FROM funnel;


WITH '3_pairs' AS(
SELECT DISTINCT q.user_id,
	 h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h’
	ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
	ON p.user_id = q.user_id
where number_of_pairs like '3%')
SELECT SUM(is_home_try_on) AS 'num_HTO',
     SUM(is_purchase) AS 'num_purchase',
  1.0 * SUM(is_purchase)/ SUM(is_home_try_on) AS '3 pairs purchase rate'
FROM '3_pairs';

WITH '5_pairs' AS(
SELECT DISTINCT q.user_id,
	 h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on AS 'h'
	ON q.user_id = h.user_id
LEFT JOIN purchase AS 'p'
	ON p.user_id = q.user_id
where number_of_pairs like '5%')
SELECT SUM(is_home_try_on) AS 'num_HTO',
     SUM(is_purchase) AS 'num_purchase',
  1.0 * SUM(is_purchase)/ SUM(is_home_try_on) AS '3 pairs purchase rate'
FROM '5_pairs';



SELECT model_name, color, COUNT(user_id) AS 'No of purchase'
FROM purchase
WHERE model_name LIKE 'Eu%'
GROUP BY 2
ORDER BY 3;
SELECT model_name, color, COUNT(user_id) AS 'No of purchase'
FROM purchase
WHERE model_name LIKE 'Da%'
GROUP BY 2
ORDER BY 3;
SELECT model_name, color, COUNT(user_id) AS 'No of purchase'
FROM purchase
WHERE model_name LIKE 'Bra%'
GROUP BY 2
ORDER BY 3;
SELECT model_name, color, COUNT(user_id) AS 'No of purchase'
FROM purchase
WHERE model_name LIKE 'Lu%'
GROUP BY 2
ORDER BY 3;
SELECT model_name, color, COUNT(user_id) AS 'No of purchase'
FROM purchase
WHERE model_name LIKE 'Oli%'
GROUP BY 2
ORDER BY 3;
SELECT model_name, color, COUNT(user_id) AS 'No of purchase'
FROM purchase
WHERE model_name LIKE 'Mono%'
GROUP BY 2
ORDER BY 3;

SELECT model_name, style, COUNT (*)
FROM purchase
WHERE price = '50’
GROUP BY 1
ORDER BY 2 DESC;
SELECT model_name, style, COUNT (*)
FROM purchase
WHERE price = '95’
GROUP BY 1
ORDER BY 2 DESC;
SELECT model_name, style, COUNT (*)
FROM purchase
WHERE price = '150’
GROUP BY 1
ORDER BY 2 DESC;



