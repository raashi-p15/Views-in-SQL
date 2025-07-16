<h1>Views in SQL</h1>

<h2>📌Objective</h2>
<mark>Learn to use and create VIEWS</mark><br>
In this task, I've used a customer retail database with various different tables to dive deep into and gain practical knowledge related to views as a part of Advanced concepts in SQL.


<h2> 📁 What's in this Repository? </h2>
1. <mark>README.md</mark> --> Project Description <br>
2. <mark>views_scriptfile.sql</mark> --> SQL script with customer database and views queries

<h2>🛠️ Tools and SQL Techniques Used</h2>
1. MySQL Workbench <br>
2. VIEWS in SQL : creating views for security and abstraction <br>
3. In a database, a view is the result set of a stored query that presents a limited perspective of the database to a user. <br>
4. Views can be used as security mechanisms by letting users access data through the view, without granting users permissions to directly access the underlying tables of the query. <br>
5. Views can be used to provide a backward compatible interface to emulate a table that used to exist but whose schema has changed. <br>
      
<h2> 📈 Insights Derived </h2>
- Clubbed customer and order tables to get a view of the order IDs of various customers <br>
- Joined product, order, and items tables together to get a view of the products included in the orders<br>
- Quantities of a product within a given range determined through a view of product and items tables together<br>
- Created a view of customer, order, and product details<br>
- Calculated the total orders of a customer through a separate view<br>


<h2>📋Developer's Note</h2>
This task is meant to familarize you with the advanced SQL concepts of VIEWS using SELECT SQL statements.
