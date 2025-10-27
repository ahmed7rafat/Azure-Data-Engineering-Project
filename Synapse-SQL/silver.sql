------------------------------------------------------------
-- STEP 1: Create Silver Schema 
------------------------------------------------------------
CREATE SCHEMA silver;
GO

------------------------------------------------------------
-- STEP 2: Create Silver Views
------------------------------------------------------------

------------------------
-- VIEW: SALES
------------------------
CREATE OR ALTER VIEW silver.sales
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_Sales/',
        FORMAT = 'PARQUET'
) AS sales;
GO


------------------------
-- VIEW: CUSTOMERS
------------------------
CREATE OR ALTER VIEW silver.customers
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_Customers/',
        FORMAT = 'PARQUET'
) AS customers;
GO


------------------------
-- VIEW: PRODUCTS
------------------------
CREATE OR ALTER VIEW silver.products
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
) AS products;
GO


------------------------
-- VIEW: RETURNS
------------------------
CREATE OR ALTER VIEW silver.returns
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_Returns/',
        FORMAT = 'PARQUET'
) AS returns_data;
GO


------------------------
-- VIEW: SUBCATEGORIES
------------------------
CREATE OR ALTER VIEW silver.subcategories
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_SUbCategories/',
        FORMAT = 'PARQUET'
) AS subcat;
GO


------------------------
-- VIEW: TERRITORIES
------------------------
CREATE OR ALTER VIEW silver.territories
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'PARQUET'
) AS territories;
GO


------------------------
-- VIEW: CALENDAR
------------------------
CREATE OR ALTER VIEW silver.calendar
AS
SELECT 
    *
FROM OPENROWSET(
        BULK 'https://awdatalakestoragep.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
        FORMAT = 'PARQUET'
) AS calendar;
GO