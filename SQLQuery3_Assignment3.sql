--Assignment 3
--USE Northwind database. All questions are based on assumptions described by the Database Diagram sent to you yesterday. When inserting, make up info if necessary. Write query for each step. Do not use IDE. BE CAREFUL WHEN DELETING DATA OR DROPPING TABLE.
USE Northwind
go
--1.Create a view named �view_product_order_[your_last_name]�, list all products and total ordered quantity for that product.
CREATE VIEW [View product order Nguyen]
AS
SELECT productID , Quantity FROM dbo.[Order Details]

SELECT* FROM products
SELECT* FROM orders
SELECT* FROM dbo.[Order Details]

--2. Create a stored procedure �sp_product_order_quantity_[your_last_name]� that accept product id as an input and total quantities of order as output parameter.

CREATE PROC sp_product_order_quantity_Nguyen

    @ProductID int,
	@TotalOrderQuanlity int output

AS
BEGIN

    select @TotalOrderQuanlity = Quantity from [View product order Nguyen] where ProductID =  @ProductID

END;

EXEC sp_product_order_quantity_Nguyen

--3.Create a stored procedure �sp_product_order_city_[your_last_name]� that accept product name as an input
--and top 5 cities that ordered most that product combined with the total quantity of that product ordered 
--from that city as output.

CREATE PROCEDURE sp_product_order_city_Nguyen
 @productName varchar(50),
  @city varchar(50) OUTPUT,
  @TotalQuantity int output
AS  
BEGIN  
SELECT TOP 5  p.ProductName, o.ShipCity, count(od.Quantity) AS TotalQuantity
FROM [Order Details] od JOIN Orders o on o.OrderID = od.OrderID JOIN products p ON p.productID = od.productID
WHERE o.ShipCity = @city 
GROUP BY p.ProductName, o.ShipCity
ORDER BY TotalQuantity DESC
 
END

EXEC sp_product_order_city_Nguyen


--4.Create 2 new tables �people_your_last_name� �city_your_last_name�. City table has two records:
--{Id:1, City: Seattle}, {Id:2, City: Green Bay}. People has three records: {id:1, Name: Aaron Rodgers, 
--City: 2}, {id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. 
--Remove city of Seattle. If there was anyone from Seattle, put them into a new city �Madison�. 
--Create a view �Packers_your_name� lists all people from Green Bay. If any error occurred, 
--no changes should be made to DB. (after test) Drop both tables and view.

CREATE TABLE city_Nguyen(
    Id INT,
    City VARCHAR(50)
)
goSELECT*FROM city_Nguyen


INSERT INTO city_Nguyen(Id, City) values(
(1,'Seattle'),
(2,'Green Bay')
)

UPDATE city_Nguyen
SET City= 'Madison'
WHERE Id = 1

CREATE TABLE people_Nguyen(
    Id INT,
    NAME VARCHAR(50),
	City int)
	
INSERT INTO people_Nguyen(Id, Name, City)    
VALUES( 
{1, 'Aaron ADDRESS',2}, 
{2, 'Russell Wilson',1}, 
{3,'Jody Nelson',2})
go
--asCreate a view �Packers_your_name� lists all people from Green Bay.Create VIEW Packers_your_name 
Create view Packers_Nguyen
as
SELECT name from people_Nguyen WHERE City =2 

SELECT* from Packer_Nguyen
drop Packers_Nguyen
DROP city_Nguyen
DROP people_Nguyen

-5.Create a stored procedure �sp_birthday_employees_[you_last_name]� that creates a new table
--�birthday_employees_your_last_name� and fill it with all employees that have a birthday on Feb. 
--(Make a screen shot) drop the table. Employee table should not be affected.


 CREATE PROC sp_birthday_employees_Nguyen
AS
BEGIN
SELECT lastName, FirstName, BirthDate FROM employees WHERE MONTH(BirthDate)=02 
END

-EXEC sp_birthday_employees_Nguyen


--6. How do you make sure two tables have the same data?

--To use a FULL OUTER JOIN between the two tables in the following form:
SELECT count (1)
    FROM table_a a
    FULL OUTER JOIN table_b b 
        USING (<list of columns to compare>)
    WHERE a.id IS NULL
        OR b.id IS NULL ;