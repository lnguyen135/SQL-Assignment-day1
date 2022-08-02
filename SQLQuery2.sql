--Write queries for following scenarios - Using AdventureWorks Database
 use AdventureWorks2019
 go
--1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter. 

select ProductID, Name, Color, ListPrice from Production.Product

--2. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, excluding the rows that ListPrice is 0.
SELECT ProductID, Name, Color, ListPrice FROM Production.Product WHERE ListPrice !=0

--3. Write a query that retrieves the columns ProductID, Name,
--Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.
SELECT ProductID, Name, Color, ListPrice FROM Production.Product WHERE Color IS NOT NULL

--4. Write a query that retrieves the columns ProductID, Name,
--Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.

SELECT ProductID, Name, Color, ListPrice FROM Production.Product WHERE Color IS NOT NULL AND  ListPrice > 0

--5. Write a query that concatenates the columns Name and Color
--from the Production.Product table by excluding the rows that are null for color.
select distinct  Name  + ' ' +  Color [Name Color] from Production.Product where Color is not null 

--6. Write a query that generates the following result set from
--Production.Product:
select distinct 'Name:'+ Name + '  ' + 'Color:' + Color [Name Color] from Production.Product where Name is not null and Color is not null

--NAME: LL Crankarm  --  COLOR: Black


--NAME: ML Crankarm  --  COLOR: Black
 

--NAME: HL Crankarm  --  COLOR: Black


--NAME: Chainring Bolts  --  COLOR: Silver


--NAME: Chainring Nut  --  COLOR: Silver


--NAME: Chainring  --  COLOR: Black

--7.Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500 using between
select ProductID, Name  from Production.Product where ProductID between 400 and 500

--8. Write a query to retrieve the to the columns  ProductID,
Name and color from the Production.Product table restricted to the colors black and blue
select ProductID, Name, Color from Production.Product where Color = 'black' or Color = 'Blue'

9. Write a query to get a result set on products that begins
with the letter S. 
select ProductID, Name, Color, ListPrice from Production.Product where name like 'S%'
              

10. Write a query that retrieves the columns Name and ListPrice
from the Production.Product table. Your result set should look something like the following. Order the result set
by the Name column. The products name should start with either 'A' or 'S'

select Name , ListPrice from Production.Product where Name like 'A%' or Name like 'S%' order by Name

Name                                            ListPrice


Adjustable Race                                   0,00


All-Purpose Bike Stand                       159,00


AWC Logo Cap                                      8,99


Seat Lug                                          0,00


Seat Post                                         0,00



11. Write a query so you retrieve rows
that have a Name that begins with the letters SPO, but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column.

select Name , ListPrice from Production.Product where Name like 'SPO[^K]%'

12. Write a query that retrieves the unique combination of
columns ProductSubcategoryID and Color from the Production.Product table. We do not want any rows that are NULL.in any of the two columns in the result. (Hint: Use IsNull)
 select distinct ProductSubcategoryID, Color from Production.Product where ProductSubcategoryID is not null and Color is not null