###Limits allows us to show a specific number of items
/* writing a quesry to display all the data in the occured_at, accound_id and channel columns
of the table and limit the output to only the first 15 rows */

select occurred_at, account_id, channel
from web_events
limit 15;

###orderby allows us to sort the results of our query using the data in any column
/*1) write a query to return the 10 earliest orders in the orders table. include the id,occured_at and total_amt_usd.*/

select id, occurred_at, total_amt_usd 
from orders
order by occurred_at
limit 10

/*2) write a query to return the top 5 orders in terms of the largest total_amt_usd.include the id, account_id and total_amt_usd.*/

select id, account_id ,total_amt_usd
from orders
order by total_amt_usd desc
limit 5

/*3) write a query to return the lowest 20 orders in terms of the smallest total_amt_usd. include the id,account_id and total_amt_usd.*/

select id, account_id, total_amt_usd
from orders
order by total_amt_usd
limit 20


###Order by over multiple colums

/*1) write a query that displays the order id , account id and total dollar amount for all the orders, sorted first by account id(in ascendin) ad then
by total dollar amount(in descending).*/

select id, account_id, total_amt_usd
from orders 
order by account_id, total_amt_usd desc

/*2) write a query that displays the order id , account id and total dollar amount for all the orders, sorted first by total dollar amount (in descending) ad then
by account id(in ascendin).*/

select id, account_id, total_amt_usd
from orders
order by total_amt_usd desc, account_id

/*3) compare both results .*/
/*Answer: In query 1 all the orders for each account id are grouped together and then within each group, the order appear from
greastes to least

in query 2, the orders aresorted from greatestto least regardless of the accout they are from. then they were sorted 
by accoutid.(The secondary sorting by account ID is difficult to see here since only if there were two orders 
with equal total dollar amounts would there need to be any sorting by account ID.)*/


###The WHere Clause
/*it allows us to filter a set of result based on some certain criteria .*/

/*Write a query that pulls the first 5 rows and all columns from the orders table 
that have a dollar amount of gloss_amt_usd greater than or equal to 1000.*/

select * 
from orders
Where gloss_amt_usd >= 1000
limit 5

/*Write a query that pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.*/

select * 
from orders
Where total_amt_usd <500
limit 10


###Where with Non-Numeric Data

/*write a quesy to filter the accounts table to include the company name, website, and the primary point of 
contact (primary_poc) just for the Exxon Mobil company in the accounts table.*/

select name, website, primary_poc
from accounts
where name = 'Exxon Mobil'

####Derived Columns
/*This is a temporary column only existing in the duartion of the query ad it is created through the combination 
of existing columns and it can be given a ame using the alias or the AS keyword.*/

/* 1) Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. 
Limit the results to the first 10 orders, and include the id and account_id fields.*/

select id,account_id, (standard_amt_usd / standard_qty) as unit_price
from orders
limit 10

/* 2) Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the 
columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also.*/

select id,account_id, ((poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd)) *100) as percent_unit_price
from orders
limit 10


###The Like Logical Operator
/*This is uded when you want to look for a text that is similar within a table or column. 
it is also used alongside wildcards*/

/*Use the accounts table to find;
1) All the companies whose names start with 'C'.*/

select name
from accounts
where  name like 'C%'

/*All companies whose names contain the string 'one' somewhere in the name.*/
select name
from accounts
where  name like '%one%'

/*All companies whose names end with 's'.*/

select name
from accounts
where  name like '%C'

###IN OPERATOR
/* Helps to filter data based on several possible values.*/

/*Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.*/

select name, primary_poc, sales_rep_id
from accounts
where name in ('Walmart', 'Target', 'Nordstrom')

/*Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.*/

select *
from web_events
where channel in ('organic', 'adwords')


###NOT OPERATOR

/* it helps us to grab all ofthe rows that do ot meet a particular criteria.*/

/*1) Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.*/

select name, primary_poc, sales_rep_id
from accounts
where name not in ('Walmart', 'Target', 'Nordstrom')

/*2) Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or 
adwords methods.*/

select *
from web_events
where channel not in ('organic', 'adwords')

/*3) All the companies whose names do not start with 'C'.*/

select name
from accounts
where  name not like 'C%'

/*4) All companies whose names do not contain the string 'one' somewhere in the name.*/

select name
from accounts
where  name not like '%one%'

/*5) All companies whose names do not end with 's'.*/

select name
from accounts
where  name not like '%s'


###AND and BETWEEN
/*it heps us filter based from several criteria*/

/*1) Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.*/

select *
from orders
where standard_qty > 1000 and poster_qty = 0 and gloss_qty = 0.

/*2) Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.*/

select *
from accounts
where name not like 'C%' AND name LIKE '%S'

/*3) When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the 
answer to this important question by writing a query that displays the order date and gloss_qty data for all orders 
where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.*/

select occurred_at, gloss_qty
from orders
where gloss_qty between 24 and 29
/* from the above, it is obvious that the between invludes the endpoints in the query*/


/*4) Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, 
and started their account at any point in 2016, sorted from newest to oldest.*/

select *
from web_events
where channel in ('organic', 'adwords') and occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
order by occurred_at desc


###THE OR OPERATOR

/*Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.*/

SELECT id
from orders
where gloss_qty > 4000 or poster_qty > 4000

/*Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.*/

SELECT id
from orders
where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000)

/*Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.*/

SELECT *
from accounts
where (name like 'C%' or name like 'W%') and (primary_poc like '%ana%' or primary_poc like '%Ana%')
and primary_poc not like '%ean%'