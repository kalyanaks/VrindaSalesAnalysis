--Vrinda store--

-- Create database
CREATE DATABASE IF NOT EXISTS walmartSales;

--Create table
drop table if exists store_data;
create table store_data(
      index_no int not null primary key ,
      Order_ID varchar(50) not null ,
      Cust_ID varchar(20) not null ,
      Gender varchar(10) not null ,
      Age int not null ,
      Age_Group varchar(12) not null ,
      Date_ timestamp not null ,
      month_ varchar(7) not null ,
      Status varchar(10) not null ,
      Channel varchar(15) not null , 
      SKU varchar(30) not null ,
      Category varchar(15) not null ,
      Size_ varchar(5) not null ,
      Qty int not null ,
      currency	varchar(5) not null ,
      Amount int not null ,
      ship_city	varchar(50) not null ,
      ship_state varchar(20) not null ,
      ship_postal_code varchar(10) not null ,
      ship_country varchar (5) not null ,
      B2B boolean not null 
);
select * from store_data ;

--Feature Engineering:

alter table store_data 
add b2b_or_b2c varchar(5);

update store_data 
set b2b_or_b2c = 
           case 
           	   when b2b = true then 'B2B'
           	   else 'B2C'
           end;

---Data cleaning---
select count(*) from store_data sd ;

select count(distinct order_id) from store_data sd ;

select count(distinct cust_id) from store_data sd ;

select round(avg (age),2) from store_data sd ;

select distinct age_group from store_data sd ;

select distinct channel from store_data sd ;

select distinct category from store_data sd ;

select sum(qty) from store_data sd ;

select max(qty) from store_data;

select min(qty) from store_data;

select sum(amount) from store_data sd ;

select distinct ship_city from store_data sd ;

select distinct ship_state from store_data sd ;

update store_data 
set ship_state = trim(replace(lower(ship_state),'new',''))
where lower(ship_state) is not null ;

select distinct ship_state from store_data sd ;

update store_data 
set ship_city = trim(lower(ship_city))
where lower(ship_city) is not null ;

select distinct ship_city from store_data sd;


--------------------------------------------------------------------------
---------------------------Generic Questions------------------------------
--------------------------------------------------------------------------

-- How many unique customers are recorded in the dataset?
select 
      count(distinct cust_id)
from store_data;

-- What is the total number of orders placed?
select 
      count(order_id)
from store_data;

-- How many unique products (SKUs) are available?
select
      count(distinct sku) 
from store_data;

-- What are the unique shipping cities and states represented?

-- Unique Shipping Cities
select 
      distinct ship_city
from store_data;

--Unique Shipping States
select 
     distinct ship_state
from store_data;


-----------------------------------------------------------------------------------
------------------------Sales Performance Questions--------------------------------
-----------------------------------------------------------------------------------

--What is the total revenue generated from all sales?

select sum(amount) as total_revenue
from store_data;

--How does the total revenue vary by month?

select 
      sd.month_ as mon,
      sum(sd.amount) as sales
from  
      store_data sd 
group by 
      mon;

--Which month had the highest sales volume?

select 
      extract (month from sd.date_) as mon,
      sum(sd.qty) as volume
from  
      store_data sd 
group by  
      mon
order by 
      volume desc 
limit 1;

--What is the average order value?
  
select 
     avg(sd.amount) as ave_order_value
from
     store_data sd ;

--What is the total quantity sold per product category?
    
select 
      sd.category,
      sum(sd.qty) as total_qty
from 
      store_data sd 
group by 
      sd.category
order by 
      total_qty desc;

--Which product category generates the most revenue?

select 
      sd.category as cat,
      sum(sd.amount) as revenue
from 
      store_data sd 
group by 
      cat
order by 
      revenue desc 
limit 1;


------------------------------------------------------------------------------------------------------------
---------------------------------Customer Demographics Questions--------------------------------------------
------------------------------------------------------------------------------------------------------------

--What is the gender distribution of customers?

select
      distinct sd.gender gen,
      count(sd.cust_id) customer
from 
      store_data sd 
group by 
      gen ;

--What is the average age of customers?

select 
      round(avg(sd.age),2) as avg_age
from store_data sd ;

--How many customers fall into each age group?

select 
      distinct sd.age_group,
      count(sd.cust_id) as Customers
from
      store_data sd 
group by 
      sd.age_group;

--What is the average order value by gender?

select 
      sd.gender ,
      round(avg(sd.amount),2)
from store_data sd 
group by 1;


--------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Order Status Questions---------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

--What percentage of orders were completed versus canceled or returned?

with orderscount as(
     select 
           sd.status,
           count(*)as status_count
     from 
           store_data sd 
     group by 
           sd.status),
     
Totalcount as(
     select sum(status_count) as total_count
     from orderscount
     )
     
select oc.status,
       oc.status_count,
       round((oc.status_count*100/tc.total_count),2)as perc_of_orders
from orderscount oc,Totalcount tc;
      
--How does the order status vary by month?

select 
      sd.month_ as mon,
      sd.status,
      count(*) as status_count,
      row_number () over(partition by month_ order by count(*) ) as rn
from store_data sd 
group by mon,status


--What is the average order value for B2B versus B2C transactions?

select 
      b2b_or_b2c,
      round(avg(amount) ,2)
from store_data sd 
group by b2b_or_b2c;
           

---------------------------------------------------------------------------------------------------------------------------
------------------------------------------Shipping and Location Questions--------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


--Which city has the highest sales volume?

select city ,sales_volume
from(select
           sd.ship_city as city, 
           sum(qty) as sales_volume,
           row_number () over(order by sum(qty) desc) as rn 
     from store_data sd
     group by city) as ranked_cities
where rn=1;
 
--How does sales performance differ by shipping state?

select   
      sd.ship_state  as state,
      sum(sd.qty) as sales_volume,
      sum(sd.amount) as sales
from store_data sd 
group by state
order by sales desc;


-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------Channel Performance Questions-------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------


--What is the revenue generated by each sales channel?

select 
      sd.channel ,
      sum(sd.amount) as revenue
from store_data sd 
group by sd.channel
order by revenue desc;

--Which channel has the highest average order value?

select 
      sd.channel,
      round(avg(sd.amount),2) as avg_order_value
from  
      store_data sd 
group by 
      sd.channel
order by
      avg_order_value desc;

--What percentage of total sales comes from B2B versus B2C channels?

select 
      sd.b2b_or_b2c,
      sum(sd.amount) as total_sales,
      (sum(amount)*100/total_sale) as perc_of_tot_sls
from 
      store_data sd,(select sum(sd.amount) as total_sale from store_data sd ) as totals 
group by  
      b2b_or_b2c,total_sale;


------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------SKU and Product Questions---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------

--Which SKU has the highest sales volume?
     
with cte as
(select 
      distinct sd.sku,
      sum(sd.qty) sales_volume,
      dense_rank () over(order by sum(sd.qty) desc) as dn
from  
      store_data sd 
group by 
      distinct sd.sku)
select * from cte
where dn=1;

--What is the average quantity sold per SKU?

select 
     distinct sd.sku,
     avg(sd.qty) as avg_quantity
from 
     store_data sd 
group by
     sd.sku
     
--How does the quantity sold vary by size?

select 
     sd.size_,
     sum(sd.qty) as quantity
from 
     store_data sd 
group by
     sd.size_

----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------        