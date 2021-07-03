CREATE DATABASE TEST2;
USE TEST2;
CREATE TABLE Products(ProductID int, ProductName char(50),
						SupplierID int, CategoryID int, Unit int, Price int); 
select * from Products; /* Used table import wizard to import data*/

CREATE TABLE Categories	(CategoryID int, CategoryName char(100),
						Description char(200) ); 
select * from Categories; /* Used table import wizard to import data*/

Select * 
from Products
where ProductName like '%ch%';

Select * 
from Products
where Price > (SELECT avg(Price) FROM Products);

Select ProductName
from Products
left join Categories On Products.CategoryID=Categories.CategoryID
where CategoryName = "Condiments";

Select CategoryName, count(*)
from Categories
join Products On Categories.CategoryID=Products.CategoryID
Group by CategoryName;

CREATE INDEX unit_index ON Products(Unit);
Select * from Products where Unit > 500;
