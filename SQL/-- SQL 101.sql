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

-- NULL values - missing values

-- Count the number of x where X_field is missing

SELECT COUNT(x)
FROM people
WHERE x_field IS NULL;

-- Count the number of x where X_field is populated 

SELECT COUNT(x)
FROM people
WHERE x_field IS NOT NULL;

-- Summarising data using aggregate functions

AVG()
SUM()
MIN() -- non-numerical and numerical
MAX() -- non-numerical and numerical - alphabetical
COUNT()

-- Calculate the average gross of films that start with A
SELECT AVG(gross) AS avg_gross_A
FROM films
WHERE title LIKE 'A%';

-- Calculate the highest gross film released between 2000-2012
SELECT MAX(gross) AS highest_gross
FROM films
WHERE release_year BETWEEN 2000 AND 2012;


-- Calculate the average budget rounded to the thousands
SELECT ROUND(AVG(budget),-3) AS avg_budget_thousands
FROM films;


-- Aggregate functions (SUM etc) vs arithmetic (+, - / *)
-- Aggregate functions perform their functions on columns, arithmetic perform their functions on rows

SELECT (gross_film_rev - budget) AS proft
FROM films;

-- SQL expects that you want integers so (2/10) will return 0 as 10 goes into 2, 0 times



-- TOPICS TO REVISE 
-- arithmetic (integers vs non-integers)
-- order of execution
-- what are aggregate functions vs filters vs sorting functions vs comparison operators 

-- Keywords in this section

SELECT
FROM
CREATE VIEW
AS 
DISTINCT
COUNT()
AND
OR 
BETWEEN 
IN ('','')
IS NOT 
IS 
NULL
LIKE '%' '_'
HAVING


FROM WHERE GROUP BY HAVING SELECT ORDER BY LIMIT -- order of execution can't use alias with HAVING but can with ORDER BY 

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT 
    release_year,
    country,
    MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;

-- WHERE filters indiivudal records and HAVING filters grouped records

-- in what year(s) was the average film duration > 2 hours

SELECT release_year, AVG(duration) AS avg_duration
FROM films
GROUP BY release_year 
HAVING AVG(duration) > 2
