USE vk;

SELECT
	COUNT(*)
FROM
	likes
WHERE
	user_id IN (
		SELECT
			user_id
		FROM
			profiles
		WHERE
			TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10
	);
