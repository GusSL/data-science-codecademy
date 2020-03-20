 -- Feeling the table
 SELECT * FROM transactions LIMIT 5;
 
 -- Total USD all users bought
 SELECT SUM(money_in) AS 'Total IN' FROM transactions;
 
 -- Total USD all users sold
 SELECT SUM(money_out) AS 'Total OUT' FROM transactions;
 
 -- Percentage of Bitcoin investments
 SELECT
 (SELECT COUNT(money_in) FROM transactions
 WHERE currency = 'BIT') AS 'Bitcoin Investments (IN)',
 (SELECT COUNT(money_in) FROM transactions) AS 'Total Investments (IN)';
 
 -- Was the largest transaction an IN or an OUT?
 SELECT
 (SELECT MAX(money_in) FROM transactions) AS 'Max IN',
 (SELECT MAX(money_out) FROM transactions) AS 'Max OUT';
 
 -- Average IN for Ethereum
 SELECT ROUND(AVG(money_in), 2) AS 'Avg USD IN for Ethereum'
 FROM transactions
 WHERE currency = 'ETH';
 
 -- Ledger for different dates
 SELECT date,
 ROUND(AVG(money_in), 2) AS 'Average IN',
 ROUND(AVG(money_out), 2) AS 'Average OUT' FROM transactions
 GROUP BY 1 ORDER BY 1;
 