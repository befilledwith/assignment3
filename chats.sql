CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT, 
    username VARCHAR(32) NOT NULL, 
    password VARCHAR(32) NOT NULL, 
    nickname VARCHAR(32) NOT NULL, 
    profile_link VARCHAR(128) NOT NULL,
    status_message VARCHAR(60) NOT NULL,
    is_quit TINYINT NOT NULL DEFAULT 0,
    signup_date DATETIME NOT NULL,  
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
	id INT NOT NULL AUTO_INCREMENT, 
    name VARCHAR(32) NOT NULL, 
    user INT NOT NULL, 
    link VARCHAR(128) NOT NULL,
    max_capacity INT NOT NULL,
    is_quit TINYINT NOT NULL DEFAULT 0,
    create_date DATETIME NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (user)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
	id INT NOT NULL AUTO_INCREMENT, 
    content VARCHAR(160) NOT NULL, 
    writer INT NOT NULL, 
    channel INT NOT NULL,
    create_date DATETIME NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (writer)
    REFERENCES users(id) ON DELETE CASCADE, 
    FOREIGN KEY (channel)
    REFERENCES channels(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
	id INT NOT NULL AUTO_INCREMENT,  
    follower INT NOT NULL, 
    followee INT NOT NULL,
    follow_date DATETIME NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (follower)
    REFERENCES users(id) ON DELETE CASCADE, 
    FOREIGN KEY (followee)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
	id INT NOT NULL AUTO_INCREMENT,  
    blocker INT NOT NULL, 
    blocked INT NOT NULL,
    block_date DATETIME NOT NULL, 
    PRIMARY KEY (id),
    FOREIGN KEY (blocker)
    REFERENCES users(id) ON DELETE CASCADE, 
    FOREIGN KEY (blocked)
    REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;