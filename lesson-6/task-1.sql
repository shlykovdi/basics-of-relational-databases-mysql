USE vk;

SET @user_id = 1;

SELECT
	from_user_id,
	COUNT(*) AS count_msg
FROM 
	messages
WHERE
	to_user_id = @user_id
GROUP BY
	from_user_id
ORDER BY
	count_msg DESC
LIMIT 1;
