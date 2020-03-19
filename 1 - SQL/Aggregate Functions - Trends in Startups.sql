
-- Total number of companies
select count(*) as 'Total companies' from startups;

-- Total value of all companies
select sum(valuation) as 'Total valuation' from startups;

-- Maximum amount raised by a startup
select name, max(raised) from startups;

-- Maximum amount raised by a startup in seed stage
select name, max(raised) from startups
where stage = 'Seed';

-- Oldest company
select name, min(founded) from startups;

--------------------------------------
-- Valuations among different sectors
--------------------------------------

-- Avg valuation (rounded and sorted desc) per category
select category, round(avg(valuation), 2) from startups
group by 1 order by 2 desc;

-- Total companies per category (more than 3 in avg)
select category, count(*) from startups
group by category having count(*) > 3;

-- Avg size of startups per location (more than 500 in avg)
select location, avg(employees) from startups
group by location having avg(employees) > 500;