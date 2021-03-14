USE vk;

SELECT
	gender
FROM (
	SELECT
		COUNT(*) as like_counter,
		(SELECT gender FROM profiles WHERE user_id = likes.user_id) as 'gender'
	FROM 
		likes
	GROUP BY
		gender
	HAVING
		gender = 'm'
	
	UNION ALL
	
	SELECT
		COUNT(*) as like_counter,
		(SELECT gender FROM profiles WHERE user_id = likes.user_id) as 'gender'
	FROM 
		likes
	GROUP BY
		gender
	HAVING
		gender = 'f'
) AS OMG
ORDER BY
	like_counter DESC
LIMIT 1;
