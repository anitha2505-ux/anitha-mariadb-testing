-- Only creates the dtabase if the databse does not exist
CREATE DATABASE IF NOT EXISTS library;

USE library;

-- only creates the table if the table does not exist
-- <col name> <data type> <options>
-- TABLES NAMES AND COLUMN NAMES ARE CASE SENSITIVE, KEEP IT lower case
CREATE TABLE IF NOT EXISTS books (
    book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
) ENGINE = INNODB;


CREATE TABLE IF NOT EXISTS authors (
    author_id INT INSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255), NOT NULL,
    last_name VARCHAR(255), NOT NULL,
    date_of_birth DATE
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS authors_books (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    book_id INT UNSIGNED NOT NULL,
    author_id INT UNSIGNED NOT NULL
) ENGINE = INNODB;


ALTER TABLE authors_books ADD CONSTRAINT fk_authors_authors_books
    FOREIGN KEY(author_id) REFERENCES authors(author_id);

ALTER TABLE authors_books ADD CONSTRAINT fk_books_authors_books
    FOREIGN KEY(book_id) REFERENCES books(book_id);