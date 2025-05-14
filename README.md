#Data Analysis with Complex Queries

COMPANY : CODTECH IT SOLUTIONS

NAME : Nikeeta Nitin Sawant

INTERN ID : CT04DK245

Domain : sql

Duration : 4 WEEKS

MENTOR : Neela Santosh Kumar





Internship Report: Sales Trend Analysis Using SQL

As part of my internship, I was given the task of analyzing sales trends using structured SQL queries. The goal was to create a mini sales database, populate it with realistic data, and then write queries that could generate business insights — such as identifying high-performing products, calculating cumulative sales, and tracking monthly trends.
To begin, I used MySQL Workbench to build and manage the database. I created a database called SalesAnalysis containing three key tables: Categories, Products, and Sales. Each table served a specific purpose. The Categories table stored product segments like Electronics, Furniture, and Clothing. The Products table listed individual items along with their category and base sales price. The Sales table recorded every transaction, including the product sold, date, and sales amount.
Once the data was set up, I moved on to the analytical part of the task. I started by writing a query to calculate the cumulative or running total of sales for each product over time. To achieve this, I used the SUM() window function with the OVER() clause, partitioned by product name and ordered by sales date. This helped visualize how each product’s revenue grew over time, showing whether the sales were consistent or concentrated in certain periods.
Next, I focused on identifying the top-selling product in each category. For this, I used a subquery that found the maximum sales amount per category, and then filtered the products that matched those values. This allowed me to list the highest-earning product in Electronics, Furniture, and Clothing categories. It simulated a real-world use case where managers need to know which products drive the most revenue in each segment.
Finally, I wrote a more advanced query using a Common Table Expression (CTE) to analyze monthly sales and average sales per product. In the first part of the CTE, I grouped the sales data by product and month, calculating total sales for each combination. In the main query, I applied the AVG() window function to determine the average monthly sales per product. This helped in identifying fluctuations — like which months had better performance and whether a product had stable or volatile sales.
Throughout the task, I used MySQL Workbench for writing and running SQL queries. The tool made it easier to debug, visualize table relationships, and understand how changes in data impacted the resultThis exercise gave me practical experience with analytical SQL, particularly with window functions, CTEs, and subqueries. It also helped me understand how simple tables can be used to simulate real business scenarios and generate useful insights. From identifying best-selling products to tracking trends over time, I learned how SQL can be a powerful tool for business decision-making.
Overall, this task enhanced my understanding of sales data analysis and strengthened my skills in writing meaningful, performance-driven SQL queries

#Output 

![Image](https://github.com/user-attachments/assets/039a891b-30fa-450e-9645-c50823e9768b)
