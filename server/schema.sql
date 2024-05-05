CREATE DATABASE Todo_app;

USE todo_app;

CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE todos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE shared_todos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    share_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES todos (id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

--Insert two users into the users table
INSERT INTO users (name, email, password) VALUES ('Erick', 'user1@example.com','password1');
INSERT INTO users (name, email, password) VALUES ('Joudy', 'user2@example.com','password2');

--INSERT TODOS INTO THE TODOS TABLE
INSERT INTO todos (title, user_id) 
VALUES
("Go for a morning run", 1),
("Work on project presentation", 1),
("Go grocery shopping", 1),
("Read 30 pages of book programing", 1),
("Ride bike to the park", 1),
("Cook dinner for family", 1),
("Practice yoga", 1),
("Listen to a podcast", 1),
("Clean the house", 1),
("Get 8 hours of sleep", 1);

INSERT INTO shared_todos(todo_id, user_id, share_with_id)
VALUES (1, 1, 2);

SELECT todos.*, shared_todos.share_with_id
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.share_with_id = [user_id];