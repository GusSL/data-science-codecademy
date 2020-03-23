-- Feeling the tables
SELECT * FROM trips LIMIT 3;
SELECT * FROM riders LIMIT 3;
SELECT * FROM cars LIMIT 3;

-- The 3 tables have their primary key named "id".

-- Is the Cross Join between riders and cars useful?
SELECT * FROM riders CROSS JOIN cars; -- Not so much.

-- Trip log
SELECT * FROM trips t LEFT JOIN riders r
ON t.rider_id = r.id;

-- Cars used during trips
SELECT * FROM trips t JOIN cars c
ON t.car_id = c.id;

-- Stacking the new riders
SELECT * FROM riders
UNION SELECT * FROM riders2;

-- Cost of average trip
SELECT AVG(cost) AS 'Average Cost' FROM trips;

-- Riders who have user REBU less than 500 times
SELECT first||' '||last AS 'Full Name', username, total_trips
FROM riders
WHERE total_trips < 500;

-- Total active cars
SELECT COUNT(*) AS 'Total Active Cars' FROM cars
WHERE status = 'active';

-- The two cars with mor trips completed
SELECT model, OS, trips_completed FROM cars
ORDER BY 3 DESC LIMIT 2;
