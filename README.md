# Vrinda Cloth Store Sales Analysis

## About

This project aims to explore the Vrinda Cloth store sales data to understand the sales by different channels , products and sales trend . This aims is to study how sales strategies can be improved and optimized . The data was obtained from [Kaggle Vrinda Store Sales data](https://www.kaggle.com/datasets/anshika2301/vrinda-store-data-analysis)

## Purpose Of The Project

The major aim of thie project is to gain insight into the sales data of Vrinda Store to understand the different factors that affect sales through different channels.

## About Data

The data was obtained from [Kaggle Vrinda Store Sales data](https://www.kaggle.com/datasets/anshika2301/vrinda-store-data-analysis).
this data contains sales transactions of Vrinda store through different channels like online and offline aswell.The data contains 21 columns and 31,047 rows.

|Column|Description|Data type|
|----------|---------------|---------|
|Index_no	 | Primary key , unique identifier for each record.   |INT|
|Order_ID	 | Unique identifier for each order.	|VARCHAR(50)|
|Cust_ID	   | Unique identifier for each customer.|VARCHAR(20)|
|Gender	   | Gender of the customer.	|VARCHAR(10)|
|Age	       | Age of the customer.|INT|
|Age_Group	 | Category for grouping customers by age(e.g.,”Adult” , “Senior”).	|VARCHAR(12)|
|Date	     | Timestamp for when the order was placed.	|TIMESTAMP|
|Month_	   | Month when the order was placed, in a string format(e.g.,”April”).|VARCHAR(7) |
|Status	   | Status of the order(e.g.,”Delivered” , ”Returned” ).	|VARCHAR(10)|
|Channel	   | Sales channel used(e.g.,”Amazon” , “Flip-kart”).	|VARCHAR(10)|
|SKU	       | Stock keeping unit ,unique identifier for each product.	|VARCHAR(30)|
|Category	 | Category of which the product belongs.	|VARCHAR(15)|
|Size	     | Size of the product.	|VARCHAR(5)|
|Qty	       | Quantity of the product ordered.|INT|
|currency	 | Currency of the transaction(e.g.,”USD” , “INR”).|VARCHAR(5)|
|Amount	   | Total amount of the specified currency.	|INT|
|Ship_city	 | City which the order is shipped.	|VARCHAR(50)|
|Ship_state | State which the order is shipped.	|VARCHAR(20)|
|Ship_postal_code	| Postal code for the ship address.	|VARCHAR(10)|
|Ship_country	| Country which the order is shipped.	|VARCHAR(5)|
|B2B	        |Boolean value indicating, if the order is business-to-business(True) or business-to-customer(False).	|BOOLEAN|


## Analysis List

### Product Analysis
> Conduct analysis on the data to understand the different product lines, the product lines performing best, and the product lines that need improvement.

### Sales Analysis
> This analysis aims to answer the sales trends of products. The result can help measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

### Customer Analysis
> This analysis aims to uncover the different customer segments, purchase trends, and the profitability of each customer segment.

### Shipping and Location Analysis
> Analyze the geographic distribution of sales and shipping performance.

### SKU and Product Analysis
> Assess the performance of individual SKUs.


## Approach used

1. **Data Wrangling:** This is the first step where inspection of data is done to make sure **NULL** values and missing values are detected and data replacement methods are used to replace, missing or **NULL** values.

> 1.Build a database.

> 2.Create table and insert the data.

> 3.Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

2. **Feature Engineering:** This will help use generate some new columns from existing ones.

> 1.Add a new column named b2b_or_b2c to identify every order is business-to-business(B2B) or business-to-consumer(B2C)

3. **Exploratory Data Analysis (EDA):** Exploratory data analysis is done to answer the listed questions and aims of this project.

4. **Conclusion:**

## Business Questions for "Vrinda Store Sales"

### Generic Questions

> 1. How many unique customers are recorded in the dataset?

> 2. What is the total number of orders placed?

> 3. How many unique products (SKUs) are available?

> 4. What are the unique shipping cities and states represented?

### Sales Performance Questions

> 5. What is the total revenue generated from all sales?

> 6. How does the total revenue vary by month?

> 7. Which month had the highest sales volume?

> 8. What is the average order value?

> 9. What is the total quantity sold per product category?

> 10. Which product category generates the most revenue?

### Customer Demographics Questions

> 11. What is the gender distribution of customers?

> 12. What is the average age of customers?

> 13. How many customers fall into each age group?

> 14. What is the average order value by gender?

### Order Status Questions

> 15. What percentage of orders were completed versus canceled or returned?

> 16. How does the order status vary by month?

> 17. What is the average order value for B2B versus B2C transactions?

### Shipping and Location Questions

> 18. Which city has the highest sales volume?

> 19. What is the average shipping time for orders in different states?

> 20. How does sales performance differ by shipping country?

### Channel Performance Questions
 
> 21. What is the revenue generated by each sales channel (e.g., online, in-store)?

> 22. Which channel has the highest average order value?

> 23. What percentage of total sales comes from B2B versus B2C channels?

### SKU and Product Questions

> 24. Which SKU has the highest sales volume?

> 25. What is the average quantity sold per SKU?

> 26. How does the quantity sold vary by size?

## Code

For the rest of the code,check the [SQl

