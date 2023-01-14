
/* 1) Find the total amount of poster_qty paper ordered in the orders table.*/

select sum(poster_qty) as Sum_Poster
from orders;

/* 2) Find the total amount of standard_qty paper ordered in the orders table.*/

select sum(standard_qty) as total_standard_sales
from orders;

/* 3) Find the total dollar amount of sales using the total_amt_usd in the orders table.*/

select sum(total_amt_usd) as Total_amount
from orders;

/* 4) Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a 
dollar amount for each order in the table.*/

select sum(standard_amt_usd) as Standard_Amount,
    sum(gloss_amt_usd) as Gloss_Amount
from orders;

/* 5) Find the total amount for each individual order that was spent on standard and gloss paper in the orders table. 
This should give a dollar amount for each order in the table.*/

select standard_amt_usd + gloss_amt_usd as total_standard_gloss
from orders;

/* 6) When was the earliest order ever placed? You only need to return the date.*/

select min(occurred_at) 
from orders;

/* 7) Try performing the same query as in question 1 without using an aggregation function.*/

select occurred_at
from orders
order by occurred_at
limit 1;

/* 8) When did the most recent (latest) web_event occur?*/

select max(occurred_at)
from web_events

/* 9) Try to perform the result of the previous query without using an aggregation function.*/

select occurred_at
from web_events
order by occurred_at desc
limit 1;

/* 10) Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. 
Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.*/

select avg(standard_qty) mean_standard, avg(gloss_qty) mean_gloss, 
       avg(poster_qty) mean_poster,avg(standard_amt_usd) mean_standard_usd, 
        avg(gloss_amt_usd) mean_gloss_usd, avg(poster_amt_usd) mean_poster_usd
from orders;
