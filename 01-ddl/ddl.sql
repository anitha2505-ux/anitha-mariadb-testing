-- ddl = data definition language 
-- dml = data modelling language
-- dql = data query language

CREATE DATABASE swimming_coach;

-- show databases in the server
SHOW DATABASES;

-- switch to the new database we created
USE swimming_coach;

-- create parents table
CREATE TABLE parents (
    parent_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45)
 ) engine = innodb; -- create indexes on the table, 
 -- allows searches, foreign keys, this will create a table with no columns

 SHOW TABLES;

 CREATE TABLE students (
    studend_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(45) NOT NULL,
        last_name VARCHAR(45),
        swimming_level TINYINT,
        dob DATETIME
 ) engine = innodb; 

 -- SEE THE COLUMNS AND DATATYPES OF THE TABLE
 DESCRIBE students;

 -- ALTER TABLE: the command for adding, modifying and deleting columns in a table
 ALTER TABLE students ADD COLUMN parent_id INT UNSIGNED NOT NULL;

 -- set students.parent_id as a foriegn key
 ALTER TABLE students ADD CONSTRAINT fk_parents_students
   FOREIGN KEY (parent_id) REFERENCES parents(parent_id) ON DELETE CASCADE ON UPDATE RESTRICT; 

-- delete column
ALTER TABLE students
DROP COLUMN first_name;

-- delete foreign key
ALTER TABLE students
DROP FOREIGN KEY fk_parents_students;

-- modify column
ALTER TABLE parents MODIFY COLUMN first_name VARCHAR(55) NOT NULL;

-- INSERT SOME PARENTS (DML)
INSERT INTO parents (first_name, last_name) VALUES ("ANITHA", "MARIAPPAN");
INSERT INTO students (first_name, last_name, dob, parent_id) VALUES ("Nikhil", "N", "2007-09-02", "1");

-- READ THE RECORD FROM THE TABLE (DQL)
SELECT * FROM parents; 