-- ==========================
--    SCRIPT SCHEME
-- =========================

-- -------------------------
-- Database - creating
-- Comment this script part, if you run the script on the faculty MSSQL server.
-- -------------------------
USE master
GO

IF DB_ID('MyDatabase') IS NOT NULL
CREATE DATABASE MyDatabase
GO

USE MyDatabase

-- ------------------------------------------------------
-- Tables - deleting (in reverse order to create!)
-- ------------------------------------------------------
IF OBJECT_ID('Table7','U') IS NOT NULL
DROP TABLE Table3

IF OBJECT_ID('Table6','U') IS NOT NULL
DROP TABLE Table4

.....

IF OBJECT_ID('Table1','U') IS NOT NULL
DROP TABLE Table1
GO

-- --------------------------------
-- Tables - creating
-- --------------------------------
IF OBJECT_ID('Table1','U') IS NULL
CREATE TABLE Table1 (
-- ...
-- ...
)

IF OBJECT_ID('Table2','U') IS NULL
CREATE TABLE Table2 (
-- ...
-- ...
)

...

IF OBJECT_ID('Table3','U') IS NULL
CREATE TABLE Table7 (
-- ...
-- ...
)
GO

-- ---------------------------------
-- Insertin test data to tables
-- ---------------------------------
INSERT INTO Table1 (col1, col2,...) VALUES 
	(val1, val2, ...),
	(val1, val2, ...),
	...
	(val1, val2, ...)
GO

INSERT INTO Table2 (col1, col2,...) VALUES 
	(val1, val2, ...),
	(val1, val2, ...),
	...
	(val1, val2, ...)
GO

.........

INSERT INTO Table7 (col1, col2,...) VALUES 
	(val1, val2, ...),
	(val1, val2, ...),
	...
	(val1, val2, ...)
GO

-- ---------------------------------
-- Views - creating
-- ---------------------------------
IF OBJECT_ID('View1','V') IS NOT NULL
DROP VIEW View1
GO

CREATE VIEW View1 AS (

)
GO

IF OBJECT_ID('View2','V') IS NOT NULL
DROP VIEW View2
GO

CREATE VIEW View2 AS (

)
GO

IF OBJECT_ID('View3','V') IS NOT NULL
DROP VIEW View3
GO

CREATE VIEW View3 AS (

)
GO


-- ---------------------------------
-- Procedures - creating
-- ---------------------------------
IF OBJECT_ID('Proc1','P') IS NOT NULL
DROP PROCEDURE Proc1
GO

CREATE PROCEDURE Proc1 AS ( @sett1 ...

)
GO

IF OBJECT_ID('Proc2','P') IS NOT NULL
DROP PROCEDURE Proc2
GO

CREATE PROCEDURE Proc2 AS ( @sett1 ...

)
GO

-- ---------------------------------------------
-- Reports - creating
-- ---------------------------------------------

-- Report name 1
SELECT * FROM View1

-- Report name 2
SELECT * FROM View2

-- Report name 3
SELECT * FROM View3

-- Report name 4
EXEC Proc1 ...

-- Report name 5
EXEC Proc2 ...


-- ---------------------------------------------
-- Database - deleting
-- Comment this script part, if you run the script on the faculty MSSQL server.
-- ---------------------------------------------
USE master
GO

IF DB_ID('MyDatabase') IS NOT NULL
DROP DATABASE MyDatabase
GO
