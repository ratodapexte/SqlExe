--1 - We have a table called Shippers. Return all the fields from all the shippers

SELECT * FROM Shippers;

--2 -In the Categories table, selecting all the fields using this SQL:
--Select * from Categories
--…will return 4 columns. We only want to see two columns, CategoryName and Description. 

SELECT "CategoryName", "Description" FROM categories;

--3 - We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales
--Representative. Write a SQL statement that returns only those employees.

SELECT "FirstName", "LastName", "HireDate" FROM employees where
 "Title" = 'Sales Representative';

 --4 - Now we’d like to see the same columns as above, but only for those employees that both have the title of
--Sales Representative, and also are in the United States.

SELECT "FirstName", "LastName", "HireDate" FROM employees where
 "Title" = 'Sales Representative' AND "Country" = 'USA';

--5 - Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven
--Buchanan) is 5.

SELECT "OrderID", "OrderDate" FROM orders WHERE "EmployeeID" = 5;

--6 - In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers whose
--ContactTitle is not Marketing Manager.

SELECT "SupplierID", "ContactName", "ContactTitle" FROM Suppliers 
 WHERE NOT "ContactTitle" = 'Marketing Manager';

--7 - In the products table, we’d like to see the ProductID and ProductName for those products where the
--ProductName includes the string “queso”. 

SELECT "ProductID", "ProductName" FROM Products
 WHERE "ProductName" LIKE '%Queso%';

--8 - Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID,
--CustomerID, and ShipCountry for the orders where the ShipCountry is either France or Belgium. 

SELECT "OrderID", "CustomerID", "ShipCountry" FROM Orders
WHERE "ShipCountry" = 'France' OR "ShipCountry" = 'Belgium';

/*9 - Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the
orders from any Latin American country. But we don’t have a list of Latin American countries in a table
in the Northwind database. So, we’re going to just use this list of Latin American countries that happen to
be in the Orders table:
Brazil
Mexico
Argentina
Venezuela*/

SELECT "OrderID", "CustomerID", "ShipCountry" FROM Orders
WHERE "ShipCountry" IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

/*10 - For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. Order
the results by BirthDate, so we have the oldest employees first.*/

SELECT "FirstName", "LastName", "Title", "BirthDate" FROM Employees 
ORDER BY "BirthDate";

/*11 - Já vai normal*/

/*12 - Show the FirstName and LastName columns from the Employees table, and then create a new column
called FullName, showing FirstName and LastName joined together in one column, with a space inbetween.
*/

SELECT "FirstName", "LastName", 
 CONCAT("FirstName",' ', "LastName") AS "FullName"
 FROM Employees;

/*13 - In the OrderDetails table, we have the fields UnitPrice and Quantity. Create a new field, TotalPrice, that
multiplies these two together. We’ll ignore the Discount field for now.
In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.*/

SELECT "OrderID", "ProductID" , "UnitPrice" , "Quantity",
 "UnitPrice" * "Quantity" AS "TotalPrice" FROM "OrderDetails";

/*14 - How many customers do we have in the Customers table? Show one value only, and don’t rely on getting
the recordcount at the end of a resultset.*/

SELECT count(*) FROM Customers;

/*15 - Show the date of the first order ever made in the Orders table.*/

SELECT min("OrderDate") AS "FirstOrder" FROM Orders;

/*16 - Show a list of countries where the Northwind company has customers.*/

SELECT DISTINCT "Country" FROM Customers ORDER BY "Country";

/*17 - Show a list of all the different values in the Customers table for ContactTitles. Also include a count for
each ContactTitle.*/

SELECT DISTINCT "ContactTitle", count(*) FROM Customers GROUP BY "ContactTitle";

/*18 - We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the
CompanyName of the Supplier. Sort by ProductID.*/

SELECT "ProductID", "ProductName", "CompanyName" FROM Products p 
 INNER JOIN Suppliers s ON p."SupplierID" = s."SupplierID" 
 ORDER BY "ProductID";

/*19 - We’d like to show a list of the Orders that were made, including the Shipper that was used. Show the
OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID.*/

SELECT "OrderID", "OrderDate", "CompanyName" FROM Orders o 
INNER JOIN Shippers s ON o."ShipVia" = s."ShipperID" 
WHERE "OrderID" < 10301;

/*20 - For this problem, we’d like to see the total number of products in each category. Sort the results by the
total number of products, in descending order.*/

SELECT "CategoryName", count(*) AS "TotalProducts" FROM Products p
INNER JOIN Categories c ON p."CategoryID" = c."CategoryID"  
GROUP BY "CategoryName" ORDER BY "TotalProducts" DESC;

/*21 - In the Customers table, show the total number of customers per Country and City.*/

SELECT DISTINCT "Country", "City", count(*) AS "TotalCostumers" FROM Customers 
GROUP BY "Country", "City" ORDER BY "TotalCostumers" DESC;

/*22 - What products do we have in our inventory that should be reordered? For now, just use the fields
UnitsInStock and ReorderLevel, where UnitsInStock is less than the ReorderLevel, ignoring the fields
UnitsOnOrder and Discontinued.
Order the results by ProductID.*/

SELECT "ProductID", "ProductName", "UnitsInStock", "ReorderLevel" 
 FROM Products WHERE "UnitsInStock" < "ReorderLevel" ORDER BY "ProductID";


/*23 - Now we need to incorporate these fields—UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued—
into our calculation. We’ll define “products that need reordering” with the following:
* UnitsInStock plus UnitsOnOrder are less than or equal to ReorderLevel
* The Discontinued flag is false (0).*/

SELECT "ProductID", "ProductName", "UnitsInStock", "UnitsOnOrder",
"ReorderLevel", "Discontinued" FROM Products 
WHERE "UnitsInStock" + "UnitsOnOrder" < "ReorderLevel" 
AND "Discontinued" = 0 ORDER BY "ProductID";

/*24 - A salesperson for Northwind is going on a business trip to visit customers, and would like to see a list of
all customers, sorted by region, alphabetically.
However, he wants the customers with no region (null in the Region field) to be at the end, instead of at
the top, where you’d normally find the null values. Within the same region, companies should be sorted
by CustomerID.*/

SELECT "CustomerID", "CompanyName", "Region" FROM Customers 
ORDER BY "Region";

/*25 - Some of the countries we ship to have very high freight charges. We'd like to investigate some more
shipping options for our customers, to be able to offer them lower freight charges. Return the three ship
countries with the highest average freight overall, in descending order by average freight.*/

SELECT "ShipCountry", avg("Freight") AS "AvarageFreight" FROM Orders 
 GROUP BY "ShipCountry" ORDER BY "AvarageFreight" DESC LIMIT 3;

/*26 - We're continuing on the question above on high freight charges. Now, instead of using all the orders we
have, we only want to see orders from the year 2015. */

SELECT "ShipCountry", avg("Freight") AS "AvarageFreight" FROM Orders 
 WHERE "OrderDate" IN ('2015-01-01', '2015-12-31')
 GROUP BY "ShipCountry" ORDER BY "AvarageFreight" DESC LIMIT 3;

/*29 - We're doing inventory, and need to show information like the below, for all orders. Sort by OrderID and
Product ID.*/
--apresentar o nome de todas as tabelas
-- SELECT table_name FROM informaton_schema.tables

SELECT e."EmployeeID", e."LastName", o."OrderID", p."ProductName", "Quantity"
 FROM  (((Employees e
     INNER JOIN Orders o ON e."EmployeeID" = o."EmployeeID")
    INNER JOIN Order_details od ON o."OrderID" = od."OrderID")
    INNER JOIN Products p ON od."ProductID" = p."ProductID") 
 ORDER BY "OrderID", p."ProductID";

/*30 - There are some customers who have never actually placed an order. Show these customers.*/

SELECT c."CustomerID" AS "Customers_CustomersID", "OrderID" AS "Orders_CustomerID"
 FROM Customers c LEFT JOIN Orders o 
 ON c."CustomerID" = o."CustomerID" WHERE "OrderID" is null;

/*31 - One employee (Margaret Peacock, EmployeeID 4) has placed the most orders. However, there are some
customers who've never placed an order with her. Show only those customers who have never placed an
order with her.*/



SELECT DISTINCT c."CustomerID", o."CustomerID" FROM Customers c 
 LEFT JOIN Orders o ON c."CustomerID" = o."CustomerID" AND o."EmployeeID" = 4
 WHERE o."CustomerID" is null;
