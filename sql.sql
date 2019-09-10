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
