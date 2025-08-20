SELECT * FROM sales.transactions;

SELECT count(*) FROM sales.transactions;

SELECT * FROM sales.transactions
WHERE market_code = 'Mark001';

SELECT Count(*) FROM sales.transactions
WHERE market_code = 'Mark001';

SELECT * FROM sales.transactions
WHERE currency = 'USD';

SELECT * FROM sales.date;

select sales.transactions.*, sales.date.* 
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020;

select sum(sales.transactions.sales_amount)
from sales.transactions
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020 and market_code = 'Mark001';

SELECT distinct product_code from sales.transactions
WHERE market_code = 'Mark001';

SELECT * FROM sales.transactions
Where sales_amount <= 0;

Select distinct(transactions.currency) from sales.transactions;

SELECT Count(*) FROM sales.transactions
WHERE currency = 'INR\r';

SELECT Count(*) FROM sales.transactions
WHERE currency = 'INR';

SELECT Count(*) FROM sales.transactions
WHERE currency = 'USD\r';

SELECT Count(*) FROM sales.transactions
WHERE currency = 'USD';

SELECT * FROM sales.transactions
WHERE currency = 'USD' or currency = 'USD\r';

-- total revenue in 2020

SELECT SUM(transactions.sales_amount) 
FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 and transactions.currency='INR\r' or transactions.currency='USD\r';


SELECT SUM(transactions.sales_amount) FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 and date.month_name="February" and (transactions.currency='INR\r' or transactions.currency='USD\r');

SELECT SUM(transactions.sales_qty) FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 and date.month_name="February" and (transactions.currency='INR\r' or transactions.currency='USD\r');


SELECT SUM(transactions.sales_amount) FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 and transactions.market_code = 'Mark001';

SELECT SUM(transactions.sales_qty) FROM transactions 
INNER JOIN date 
ON transactions.order_date=date.date 
where date.year=2020 and transactions.market_code = 'Mark001';

select sales.customers.custmer_name , SUM(sales.transactions.sales_amount)
from sales.transactions
inner join sales.customers
on sales.transactions.customer_code = sales.customers.customer_code
group by 1 order by 2 desc
limit 5;

select sales.customers.custmer_name , SUM(sales.transactions.sales_amount)
from sales.transactions
inner join sales.customers
on sales.transactions.customer_code = sales.customers.customer_code
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020
group by 1 order by 2 desc
limit 5;

select sales.products.product_code , SUM(sales.transactions.sales_amount)
from sales.transactions
inner join sales.products
on sales.transactions.product_code = sales.products.product_code
inner join sales.date
on sales.transactions.order_date = sales.date.date
where sales.date.year = 2020
group by 1 order by 2 desc
limit 5 ;
