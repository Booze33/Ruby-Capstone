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