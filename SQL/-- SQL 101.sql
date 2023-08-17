-- SQL 101
-- Field = column, record = rows
-- VARCHAR - lots of flexibility and high character limit

SELECT field
FROM table;

-- select all
SELECT *  
FROM table;

-- select multiple and view a table - this  view will be saved and can be queried just like any other table

CREATE VIEW new_table_name AS
SELECT DISTINCT x_ID, y_name
FROM table;

-- Types of SQL: dialects 
-- PostreSQL -  free and open source (relational DB)
-- SQL server -   free and enterprise (microsoft made it) - queried with T-SQL

-- Returns the number of distinct values in field_x and the number of values populated (non-null) in field y

SELECT COUNT(DISTINCT field_x) AS name_x, COUNT(field_y) AS name_y
FROM table;

-- Returns the number of rows in the table

SELECT COUNT(*)
FROM table;


AND OR 
BETWEEN
IN

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
-- Amend the query to include Spanish or French-language films
	AND (language = 'Spanish' OR language = 'French');