-- Feeling the table
SELECT * FROM met LIMIT 5;

-- Count the pieces in the American Decorative Art collection
SELECT COUNT(*) FROM met
WHERE department = 'American Decorative Arts';

-- Count the pieces with category 'celery'
SELECT COUNT(*) FROM met
WHERE LOWER(category) LIKE '%celery%';

-- Title and medium of oldest piece(s)
SELECT title, medium, date FROM met
WHERE date = (SELECT MIN(date) FROM met);

-- Top 10 countries with the most pieces
SELECT IFNULL(country, 'Unknown') AS 'Country',
COUNT(*) AS 'Pieces' FROM met
GROUP BY 1 ORDER BY 2 DESC LIMIT 10;

-- Categories with more than 100 pieces
SELECT category, COUNT(*) AS 'Pieces' FROM met
GROUP BY 1 HAVING COUNT(*) > 100 ORDER BY 2 DESC;

-- Pieces with medium of gold or silver
SELECT medium, COUNT(*) FROM met
WHERE medium LIKE '%gold%'
OR medium LIKE '%silver%'
GROUP BY 1 ORDER BY 2 DESC;