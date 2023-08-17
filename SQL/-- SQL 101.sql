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

-- Filtering on numbers using comparison and logical operators < > <= >= <> OR AND

SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
	AND budget > 100000000
	AND (language = 'Spanish' OR language = 'French');


-- Filtering for strings, keywords LIKE, NOT LIKE, IN - case sensitive
-- LIKE searches for pattern - % (0,1,many characters) and _ (single character)
-- NOT LIKE is the opposite

-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
-- Filter to release_years to between 1990 and 1999
WHERE release_year BETWEEN 1990 AND 1999
-- Filter to English-language films
	AND language = ('English')
-- Narrow it down to G, PG, and PG-13 certifications
	AND certification IN ('G', 'PG', 'PG-13');