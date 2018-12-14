DROP DATABASE IF EXISTS tables;
CREATE DATABASE tables;

\c tables;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  age INT NOT NULL
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  poster_id INT REFERENCES users(id) NOT NULL,
  body VARCHAR NOT NULL
);

CREATE TABLE likes (
  id SERIAL PRIMARY KEY,
  liker_id INT REFERENCES users(id) NOT NULL,
  post_id INT REFERENCES posts(id) NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  commenter_id INT REFERENCES users(id) NOT NULL,
  post_id INT REFERENCES posts(id) NOT NULL,
  body VARCHAR NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) NOT NULL
);

CREATE TABLE pictures(
  id SERIAL PRIMARY KEY,
  album_id INT REFERENCES albums(id) NOT NULL,
  url VARCHAR NOT NULL
);

INSERT INTO users (name, age) VALUES ('Victoria Adams', 47), ('Gerson Lopez', 33)
