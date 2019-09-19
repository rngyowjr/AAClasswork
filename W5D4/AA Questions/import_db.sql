PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies; 
DROP TABLE IF EXISTS question_follows; 
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users; 

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER, 


    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    parent_id INTEGER,
    user_id INTEGER,
    body TEXT NOT NULL,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)   
);

INSERT INTO users 
  (fname, lname) 
VALUES 
  ('Alex', 'Duveneck'), 
  ('Bob', 'Andre'), 
  ('Dean', 'Lacap'), 
  ('Danna', 'Xu'), 
  ('Erik', 'Elliot');

INSERT INTO questions 
  (title, body, user_id) 
VALUES 
  ('Homework problem', 'Help! I can''t submit my work!', 1), 
  ('Kitchen problem', 'We ran out of coffee.', 2),  
  ('Bathroom problem', 'We need TP NOW!', 5);

INSERT INTO question_follows 
  (question_id, user_id) 
VALUES 
  (1, 1),
  (3, 1),
  (3, 2), 
  (3, 3), 
  (3, 4), 
  (2, 1), 
  (2, 2), 
  (3, 5);

INSERT INTO replies 
  (question_id, parent_id, user_id, body) 
VALUES 
  (2, NULL, 3, 'Go ask Jared.'), 
  (1, NULL, 3, 'Try turning it off and on again.'), 
  (3, NULL, 3, 'RIP.'), 
  (1, 2, 1, 'Fixed, thanks!');

INSERT INTO question_likes 
  (question_id, user_id) 
VALUES 
  (3, 1), 
  (3, 2), 
  (3, 3), 
  (3, 4),
  (1, 1),
  (1, 2),
  (2, 4);