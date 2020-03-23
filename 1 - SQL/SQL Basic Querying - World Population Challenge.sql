-- This is the first query (provided by Codecademy):
SELECT DISTINCT year from population_years;

-- Challenge queries:

-- Largest population in Gabon
select country, max(population), year from population_years
where country = 'Gabon';

-- 10 lowest population countries in 2005
select * from population_years
where year = 2005
order by population
limit 10;

-- Distinct countries with pop > 100 MM in 2010
select country, population from population_years
where year = 2010
and population > 100
order by population desc;

-- How many countries with name including 'Islands'
select count(*) from population_years
where lower(country) like '%islands%';

-- Population diff in Indonesia between 2000 and 2010
select 
  (select population from population_years
    where country = 'Indonesia' and year = 2010) -
  (select population from population_years
    where country = 'Indonesia' and year = 2000)
  as 'Indonesia Difference';
  
select year, population from population_years
where year in (2010, 2000)
and country = 'Indonesia';