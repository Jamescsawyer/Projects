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

-- order of execution

FROM -- choose and join tables to get base data
WHERE -- filters the base data
GROUP BY -- aggregates (summarises) base data USED WITH COUNT(), MAX(), MIN(), SUM(), AVG() aggregate functions
HAVING -- filters aggregated data (where clause for when you're using a group by)
SELECT -- returns the columns and headings
ORDER BY -- sorts the final data
LIMIT -- limits the returned data to a row count

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


-- Joins - it's common to write the FROM first, then the INNER JOIN then the ON statement to match the tables on a certain field
-- then the SELECT to choose the fields to return 

-- When selecting columns that exist in both tables, you must use the table.column_name (otherwise you can just use the name)


FROM table_1 AS t1
INNER JOIN table_2 AS t2
ON t1.column = t2.column --or USING() 

-- Inner joins

-- Outer joins
FROM table_1
LEFT JOIN table_2
ON field

-- Means there will be null values from table_1 - it joins on the field and returns all the values in table_1 

FROM table_1
RIGHT JOIN table_2
ON field

-- Full outter

https://www.w3schools.com/sql/sql_join.asp -- good visual for writing this up into jupyter

--Cross join provides all possible pairings of the listed fields

-- Not NULL statement = 

SELECT
    c.name AS name,
    life_expectancy,
    p.year AS year,
    c.region
FROM countries as c
INNER JOIN populations as p
ON c.code = p.country_code
WHERE (p.year = '2010' AND life_expectancy IS NOT NULL)
ORDER BY life_expectancy DESC
LIMIT 5;