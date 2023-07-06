CREATE TABLE books (
  id INT PRIMARY KEY,
  title TEXT,
  publish_date DATE,
  publisher TEXT,
  color TEXT,
  cover_state INT,
  archived INT
);

CREATE TABLE labels (
  id INT PRIMARY KEY,
  title TEXT,
  color TEXT
);

CREATE TABLE books_labels (
  book_id INT,
  label_id INT,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE genre (
  id INT PRIMARY KEY,
  name varchar(50)
);

CREATE TABLE musicalbums(
  id INT PRIMARY KEY, 
  name VARCHAR(255), 
  published_date DATE, 
  on_spotify BOOLEAN, 
  archived BOOLEAN, 
  author_id INT REFERENCES authors(id), 
  label_id INT REFERENCES labels(id), 
  genre_id INT REFERENCES genres(id), 
);

CREATE TABLE items (
    id INT PRIMARY KEY,
    genre VARCHAR(255),
    author VARCHAR(255),
    source VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN
);