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

CREATE TABLE music_album (
  id INT PRIMARY KEY,
  genre varchar(50),
  author_name varchar(50),
  author_lastname varchar(50),
  source_name varchar(50),
  label_title varchar(50),
  label_color varchar(50),
  pushished_date DATE,
  archived boolean,
  on_spotity boolean
)