# ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT firstname FROM users ORDER BY firstname;

# iii. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
# Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)
UPDATE profiles 
SET is_active = FALSE
WHERE YEAR(NOW()) - YEAR(date_of_birth) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(date_of_birth, '%m%d')) < 18;

# iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
DELETE FROM messages WHERE create_at > NOW();
