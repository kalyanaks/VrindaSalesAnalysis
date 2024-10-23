# Vrinda Cloth Store Sales Analysis

## About

This project aims to explore the Vrinda Cloth store sales data to understand the sales by different channels , products and sales trend . This aims is to study how sales strategies can be improved and optimized . The data was obtained from [Kaggle Vrinda Store Sales data](https://www.kaggle.com/datasets/anshika2301/vrinda-store-data-analysis)

## Purpose Of The Project

The major aim of thie project is to gain insight into the sales data of Vrinda Store to understand the different factors that affect sales through different channels.

## About Data

The data was obtained from [Kaggle Vrinda Store Sales data](https://www.kaggle.com/datasets/anshika2301/vrinda-store-data-analysis).
this data contains sales transactions of Vrinda store through different channels like online and offline aswell.The data contains 21 columns and 31,047 rows.

Columns	Description	Data type
Index_no	Primary key , unique identifier for each record.	INT
Order_ID	Unique identifier for each order.	VARCHAR(50)
Cust_ID	Unique identifier for each customer.	VARCHAR(20)
Gender	Gender of the customer.	VARCHAR(10)
Age	Age of the customer.	INT
Age_Group	Category for grouping customers by age(e.g.,”Adult” , “Senior”).	VARCHAR(12)
Date	Timestamp for when the order was placed.	TIMESTAMP
Month_	Month when the order was placed, in a string format(e.g.,”April”).	VARCHAR(7)
Status	Status of the order(e.g.,”Delivered” , ”Returned” ).	VARCHAR(10)
Channel	Sales channel used(e.g.,”Amazon” , “Flip-kart”).	VARCHAR(10)
SKU	Stock keeping unit ,unique identifier for each product.	VARCHAR(30)
Category	Category of which the product belongs.	VARCHAR(15)
Size	Size of the product.	VARCHAR(5)
Qty	Quantity of the product ordered.	INT
currency	Currency of the transaction(e.g.,”USD” , “INR”).	VARCHAR(5)
Amount	Total amount of the specified currency.	INT
Ship_city	City which the order is shipped.	VARCHAR(50)
Ship_state	State which the order is shipped.	VARCHAR(20)
Ship_postal_code	Postal code for the ship address.	VARCHAR(10)
Ship_country	Country which the order is shipped.	VARCHAR(5)
B2B	Boolean value indicating if the order is business-to-business(True) or business-to-customer(False).	BOOLEAN

