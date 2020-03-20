-- Feeling the table
SELECT title, score FROM hacker_news
ORDER BY score DESC LIMIT 5;

-- Are the forums dominated by the 1-9-90 rule?
-- Take the sum of totals per popular user...
SELECT SUM(sum_per_user.total) * 100.0 /
  -- And divide it by the total points of all users
  (SELECT SUM(score) FROM hacker_news) as 'Percentage'
FROM ( -- Custom table: totals per users
  SELECT SUM(score) AS 'total' FROM hacker_news
  GROUP BY user
  HAVING SUM(score) > 200) sum_per_user;
-- That returns the percentage of points of only the users who have
-- more than 200 pts alone, compared with the total of points (~22%)

-- Rickrollings count per user xD
SELECT user, COUNT(*) AS 'Rickrollings' FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY 1 ORDER BY 2 DESC;

-- Common feed sources for Hacker News
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source', COUNT(*) AS 'Count' FROM hacker_news
GROUP BY 1;

-- Best time to post a story
SELECT STRFTIME('%H',timestamp) AS 'Hour of the Day',
  ROUND(AVG(score)) AS 'Average Score',
  COUNT(*) AS 'Stories Posted'
FROM hacker_news
GROUP BY 1 ORDER BY 2 DESC;