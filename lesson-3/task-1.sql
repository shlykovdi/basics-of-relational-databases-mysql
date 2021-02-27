DROP TABLE IF EXISTS user_posts;
CREATE TABLE user_posts (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	
	body TEXT,
	filename VARCHAR(255),
	metadata JSON,
	media_type_id BIGINT UNSIGNED NOT NULL,
	
	create_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(),
	
	INDEX (id, user_id),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (media_type_id) REFERENCES media_type(id)
);


DROP TABLE IF EXISTS user_reposts;
CREATE TABLE user_reposts (
	id SERIAL,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	post_id BIGINT UNSIGNED NOT NULL,
	
	body TEXT,
	
	create_at DATETIME DEFAULT NOW(),
	updated_at DATETIME ON UPDATE NOW(),
	
	FOREIGN KEY (owner_user_id) REFERENCES user_posts(user_id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (post_id) REFERENCES user_posts(id),
	CHECK (owner_user_id != user_id)
);


DROP TABLE IF EXISTS friends;
CREATE TABLE friends (
	user_id BIGINT UNSIGNED NOT NULL,
	friend_id BIGINT UNSIGNED NOT NULL,
	
	INDEX (user_id, friend_id),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (friend_id) REFERENCES users(id),
	CHECK (user_id != friend_id)
);
