-- Feeling the tables
SELECT * FROM countries LIMIT 3;
SELECT * FROM population_years LIMIT 3;


-- How many countries in the table are from Africa?
SELECT COUNT(*) AS 'Countries in Africa' FROM countries
WHERE continent = 'Africa';


-- Total population of Oceania in 2005
SELECT ROUND(SUM(p.population), 4)
  AS 'Total pop. of Oceania in 2005 in MM'
FROM population_years p INNER JOIN countries c
ON p.country_id = c.id
WHERE c.continent = 'Oceania'
AND p.year = 2005;


-- Average population of countries in South America in 2003
SELECT ROUND(AVG(p.population), 4)
  AS 'Average pop. of countries in South America in 2005 in MM'
FROM population_years p INNER JOIN countries c
ON p.country_id = c.id
WHERE c.continent = 'South America'
AND p.year = 2003;


-- Country with smallest population in 2007
SELECT c.name AS 'Country', MIN(p.population) AS 'Population in MM'
FROM population_years p INNER JOIN countries c
ON p.country_id = c.id
AND p.year = 2007;


-- Average population of Poland along the dataset
-- showing the range of years it covers
WITH range_years AS (
  SELECT MIN(year) AS 'Since', MAX(year) AS 'Until'
  FROM population_years)
SELECT c.name AS 'Country',
  ROUND(AVG(p.population), 4) AS 'Average Population in MM',
  r.Since, r.Until
FROM population_years p INNER JOIN countries c ON p.country_id = c.id
CROSS JOIN range_years r
WHERE c.name = 'Poland' GROUP BY 1;


-- Count of countries with a 'The' in their names
SELECT COUNT(*) AS 'Countries with a "The" in their names'
FROM countries WHERE name LIKE '%The%';


-- Total population for each continent in 2010
SELECT c.continent AS 'Continent',
  SUM(p.population) AS 'Total Population in MM'
FROM population_years p INNER JOIN countries c
ON p.country_id = c.id
WHERE p.year = 2010
GROUP BY 1;

