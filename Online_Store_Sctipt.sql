-- -------------------------
-- Database - creating
-- -------------------------
/*
USE master
GO

IF DB_ID('OnlineShop') IS NOT NULL
CREATE DATABASE OnlineShop
GO

USE OnlineShop
*/
-- ------------------------------------------------------
-- Tables - deleting (in reverse order to create!)
-- ------------------------------------------------------

IF OBJECT_ID('Cart_Orders','U') IS NOT NULL
DROP TABLE Cart_Orders

IF OBJECT_ID('CARTS','U') IS NOT NULL
DROP TABLE CARTS 

IF OBJECT_ID('Payments_Info','U') IS NOT NULL
DROP TABLE Payments_Info 

IF OBJECT_ID('Products','U') IS NOT NULL
DROP TABLE Products 

IF OBJECT_ID('Categories','U') IS NOT NULL
DROP TABLE Categories 

IF OBJECT_ID('Manufacturers','U') IS NOT NULL
DROP TABLE Manufacturers

IF OBJECT_ID('Customers','U') IS NOT NULL
DROP TABLE Customers 
GO

-- --------------------------------
-- Tables - creating
-- --------------------------------

IF OBJECT_ID('Customers','U') IS NULL
CREATE TABLE Customers (
  ID INT IDENTITY(1,1),
  Name VARCHAR(20),
  Birth_Date DATE,
  Email VARCHAR(30),
  Country VARCHAR(20),
  PRIMARY KEY (ID)
) 

IF OBJECT_ID('Manufacturers','U') IS NULL
CREATE TABLE Manufacturers (
  Man_ID INT IDENTITY(1,1),
  Name VARCHAR(20),
  PRIMARY KEY (Man_ID)
) 

IF OBJECT_ID('Categories','U') IS NULL
CREATE TABLE Categories (
  Category_ID INT IDENTITY(1,1),
  Name VARCHAR(30),
  PRIMARY KEY (Category_ID)
) 

IF OBJECT_ID('Products','U') IS NULL
CREATE TABLE Products (
  Product_ID INT IDENTITY(1,1),
  Name VARCHAR(40),
  Price_$ MONEY,
  Discount FLOAT,
  Manufacturer_ID INT,
  Category_ID INT,
  PRIMARY KEY (Product_ID),
  FOREIGN KEY (Manufacturer_ID) REFERENCES Manufacturers(Man_ID),
  FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
) 

IF OBJECT_ID('Payments_Info','U') IS NULL
CREATE TABLE Payments_Info (
  Payment_ID INT IDENTITY(1,1),
  Payment_method VARCHAR(20),
  Payment_Service VARCHAR(20),
  PRIMARY KEY (Payment_ID)
) 

IF OBJECT_ID('CARTS','U') IS NULL
CREATE TABLE CARTS (
  Cart_ID INT IDENTITY(1,1),
  Customer_ID INT,
  Payment_ID INT,
  Order_Date DATE,
  PRIMARY KEY (Cart_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(ID),
  FOREIGN KEY (Payment_ID) REFERENCES Payments_Info(Payment_ID)
) 

IF OBJECT_ID('Cart_Orders','U') IS NULL
CREATE TABLE Cart_Orders (
  Order_ID INT,
  Product_ID INT,
  FOREIGN KEY (Order_ID) REFERENCES CARTS(Cart_ID),
  FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
  
) 
GO

-- --------------------------------
-- Tables - inserting
-- --------------------------------
--16 cust
INSERT INTO Customers VALUES 
	('Jhon',  '1982-03-23','jhon@gmail.com','Poland'),
	('Brad',  '1983-03-04','brad@gmail.com','Poland'),
	('Terry', '1990-06-27','terry@gmail.com','France'),
	('Daniel','1999-01-15','danile11l@outlook.com','Argentina'),
	('Bob',   '2005-03-23','bobilonian@icloud.com','Germany'),
	('Jake',  '2002-09-11','jakethecreator@yandex.com','Spain'),
	('Dany',  '1995-02-24','dany34@outlook.com','Spain'),
	('Brock', '1972-05-07','brockius@icloud.com','Poland'),
	('Jessy', '2006-05-16','jessy@outlook.com','Germany'),
	('Walt',  '2003-04-29','rat22@icloud.com','Spain'),
	('Monica','1993-03-19','mon@gmail.com','Argentina'),
	('Chris', '1997-07-07','man45@outlook.com','France'),
	('Cristina','1992-07-01','goddamn9@gmail.com','Poland'),
	('Katrine','2008-09-25','kat@gmail.com','Germany'),
	('Katy','1994-12-19','kosmo@gmail.com','Argentina'),
	('Joel','2005-06-12','mmm4@gmail.com','Poland')

INSERT INTO Manufacturers VALUES
	('Apple'),
	('Samsung'),
	('Xiaomi'),
	('Sony'),
	('Huawei'),
	('Microsoft')

INSERT INTO Categories VALUES
	('Smartphones'),
	('TVs'),
	('Laptops')

--17 pr	
INSERT INTO Products VALUES
	('Iphone 6s Plus', 400, 20.4, 1, 1),
	('Iphone 5', 246, 10.5, 1, 1),
	('Iphone 5s', 535, 0, 1, 1),
	('Iphone 8', 670, 0, 1, 1),
	('Galaxy s6', 710, 50, 2, 1),
	('Galaxy Note 8', 650, 0, 2, 1),
	('Tabular bomb23', 253, 5, 3, 2),
	('Huawei baby2', 356, 15.6, 5, 2),
	('Samsung creatinv54', 146, 0, 2, 2),
	('Microsoft int89', 300, 0, 6, 2),
	('Sony 34285', 402, 50, 4, 2),
	('Nebula gyt456', 400, 20.9, 2, 2),
	('Xiaomi 33233', 687, 0, 3, 3),
	('Xiaomi jou890', 900, 10, 3, 3),
	('Microsoft 345', 479, 0, 6, 3),
	('Microsoft 222', 566, 20, 6, 3),
	('Microsoft 15678iuq', 356, 30, 6, 3)


INSERT INTO Payments_Info VALUES
	('Debit card','VISA'),
	('Debit card','MASTERCARD'),
	('Web Wallet','PayPal'),
	('Web Wallet','Qiwi')

INSERT INTO CARTS VALUES
	(1, 1, '2019-01-01'),
	(2, 2, '2019-02-02'),
	(3, 3, '2019-03-03'),
	(4, 4, '2019-04-04'),
	(5, 2, '2018-05-05'),
	(6, 3, '2019-06-06'),
	(7, 1, '2018-02-07'),
	(8, 4, '2019-09-08'),
	(9, 2, '2017-04-09'),
	(10, 1, '2019-02-24'),
	(11, 4, '2019-05-13'),
	(12, 3, '2019-12-14'),
	(13, 3, '2019-03-23'),
	(14, 1, '2019-02-11'),
	(15, 2, '2019-01-17'),
	(16, 2, '2019-03-18')

INSERT INTO Cart_Orders VALUES
	(1, 1),
	(1, 3),
	(1, 17),
	(2, 4),
	(3, 2),
	(3, 5),
	(3, 6),
	(4, 11),
	(4, 15),
	(4, 16),
	(4, 7),
	(4, 7),
	(5, 12),
	(5, 5),
	(5, 6),
	(6, 9),
	(6, 1),
	(6, 2),
	(7, 10),
	(7, 6),
	(8, 11),
	(8, 16),
	(8, 5),
	(8, 17),
	(9, 11),
	(10, 13),
	(10, 8),
	(11, 14),
	(11, 10),
	(12, 15),
	(12, 7),
	(13, 16),
	(13, 14),
	(13, 1),
	(14, 17),
	(14, 10),
	(15, 1),
	(15, 11),
	(15, 6),
	(16, 5)
GO

-- ---------------------------------
-- Views - creating
-- ---------------------------------

IF OBJECT_ID('Total_Cost','V') IS NOT NULL
DROP VIEW Total_Cost
GO
CREATE VIEW Total_Cost AS (
	SELECT Order_ID,Total_Cost=SUM(Price_$),Payment_method, Payment_Service FROM Cart_Orders 
	JOIN Products ON Cart_Orders.Product_ID=Products.Product_ID
	LEFT JOIN CARTS ON Order_ID=Cart_ID
	LEFT JOIN Payments_Info ON CARTS.Payment_ID=Payments_Info.Payment_ID
	GROUP BY Order_ID,Payment_method,Payment_Service
)
GO

IF OBJECT_ID('With_Discount','V') IS NOT NULL
DROP VIEW With_Discount
GO
CREATE VIEW With_Discount AS (
	SELECT Order_ID, With_Discount=SUM(Price_$*((100 - Discount)/100)),Payment_method, Payment_Service 
	FROM Cart_Orders
	left JOIN Products ON Cart_Orders.Product_ID=Products.Product_ID
	LEFT JOIN CARTS ON Order_ID=Cart_ID
	LEFT JOIN Payments_Info ON CARTS.Payment_ID=Payments_Info.Payment_ID
	GROUP BY Order_ID,Payment_method,Payment_Service
)
GO

-- ---------------------------------
-- Procedures - creating
-- ---------------------------------

IF OBJECT_ID('Age','P') IS NOT NULL
DROP PROCEDURE Age
GO
CREATE PROCEDURE Age AS 
	SELECT ID, Name, Birth_Date,
	Age=CAST(DATEDIFF(DD, Birth_Date, Order_Date)/365.25 AS INT)
	FROM Customers
	JOIN CARTS ON ID=Customer_ID
	ORDER BY Age DESC

GO
IF OBJECT_ID('Products_Per_Country','P') IS NOT NULL
DROP PROCEDURE Products_Per_Country
GO
CREATE PROCEDURE Products_Per_Country @Country nvarchar(30) AS 
	SELECT Country, Month_=DATENAME(month, Order_Date), Product_Num=COUNT(Product_ID) FROM Cart_Orders 
	JOIN Customers ON ID=Order_ID
	LEFT JOIN CARTS ON Order_ID=Cart_ID
	WHERE Country = @Country
	GROUP BY Country, DATENAME(month, Order_Date)
	ORDER BY Product_Num DESC

GO
IF OBJECT_ID('Top3_Most_Popular_Manufacturers','P') IS NOT NULL
DROP PROCEDURE Top3_Most_Popular_Manufacturers
GO
CREATE PROCEDURE Top3_Most_Popular_Manufacturers AS 
	SELECT TOP 3 Product_Num=COUNT(Order_ID), Manufacturer_Name=Manufacturers.Name FROM Cart_Orders
	JOIN Products ON Products.Product_ID=Cart_Orders.Product_ID
	JOIN Manufacturers ON Manufacturers.Man_ID=Products.Manufacturer_ID
	GROUP BY Manufacturers.Name
	ORDER BY Product_Num DESC
GO

-- ---------------------------------------------
-- Reports - creating
-- ---------------------------------------------

--View Total_Cost--
SELECT * FROM Total_Cost

--View With_Discount--
SELECT * FROM With_Discount

--Procedure Age--
EXEC Age

--Procedure Products_Per_Country--
EXEC Products_Per_Country @Country='Germany'

--Procedure Top3_Most_Popular_Manufacturers--
EXEC Top3_Most_Popular_Manufacturers
-- ---------------------------------------------
-- Database - deleting
-- ---------------------------------------------
/*
USE master
GO

IF DB_ID('OnlineShop') IS NOT NULL
DROP DATABASE OnlineShop
GO
*/