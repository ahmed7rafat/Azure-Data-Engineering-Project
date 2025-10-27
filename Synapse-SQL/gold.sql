------------------------------------------------------------
-- Create gold schema 
------------------------------------------------------------
CREATE SCHEMA gold;
GO

------------------------------------------------------------
--  Create Dimension: date
------------------------------------------------------------
CREATE EXTERNAL TABLE gold.dim_date
WITH
(
    LOCATION = 'dim_date/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT DISTINCT
    Date AS FullDate,
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    DATENAME(MONTH, Date) AS MonthName
FROM silver.calendar;
GO


------------------------------------------------------------
--  Create Dimension: Subcategory
------------------------------------------------------------

CREATE EXTERNAL TABLE gold.dim_subcategory
WITH
(
    LOCATION = 'dim_subcategory/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT DISTINCT
    ProductSubcategoryKey,
    ProductCategoryKey,
    SubcategoryName
FROM silver.subcategories
GO


------------------------------------------------------------
--  Create Dimension: Product
------------------------------------------------------------

CREATE EXTERNAL TABLE gold.dim_product
WITH
(
    LOCATION = 'dim_product/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT DISTINCT
    p.ProductKey,
    p.ProductName,
    p.ProductColor,
    p.ProductCost,
    p.ProductPrice,
    p.ProductSize,
    p.ProductSKU,
    p.ProductStyle,
    s.SubcategoryName,
    s.ProductCategoryKey
FROM silver.products AS p
LEFT JOIN silver.subcategories AS s
    ON p.ProductSubcategoryKey = s.ProductSubcategoryKey;
GO


------------------------------------------------------------
--  Create Dimension: Customer
------------------------------------------------------------

CREATE EXTERNAL TABLE gold.dim_customer
WITH
(
    LOCATION = 'dim_customer/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT DISTINCT
    CustomerKey,
    FirstName,
    LastName,
    Gender,
    EmailAddress,
    MaritalStatus,
    EducationLevel,
    Occupation,
    AnnualIncome,
    HomeOwner,
    TotalChildren
FROM silver.customers;
GO


------------------------------------------------------------
--  Create Dimension: Territory
------------------------------------------------------------

CREATE EXTERNAL TABLE gold.dim_territory
WITH
(
    LOCATION = 'dim_territory/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT DISTINCT
    SalesTerritoryKey AS TerritoryKey,
    Continent,
    Country,
    Region
FROM silver.territories;
GO


------------------------------------------------------------
--  Create Fact Table: Sales
------------------------------------------------------------

CREATE EXTERNAL TABLE gold.fact_sales
WITH
(
    LOCATION = 'fact_sales/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT
    s.OrderNumber,
    s.OrderLineItem,
    s.ProductKey,
    s.CustomerKey,
    s.TerritoryKey,
    s.OrderQuantity,
    s.OrderDate,
    s.StockDate,
    s.multiply As TotalAmount
FROM silver.sales AS s;
GO


------------------------------------------------------------
--  Create Fact Table: Returns
------------------------------------------------------------

CREATE EXTERNAL TABLE gold.fact_returns
WITH
(
    LOCATION = 'fact_returns/',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT
    r.ProductKey,
    r.ReturnDate,
    r.ReturnQuantity,
    r.TerritoryKey
FROM silver.returns AS r;
GO


------------------------------------------------------------
--  Validation Checks
------------------------------------------------------------
SELECT COUNT(*) AS dim_date_count FROM gold.dim_date;
SELECT COUNT(*) AS dim_subcategory_count FROM gold.dim_subcategory;
SELECT COUNT(*) AS dim_product_count FROM gold.dim_product;
SELECT COUNT(*) AS dim_customer_count FROM gold.dim_customer;
SELECT COUNT(*) AS dim_territory_count FROM gold.dim_territory;
SELECT COUNT(*) AS fact_sales_count FROM gold.fact_sales;
SELECT COUNT(*) AS fact_returns_count FROM gold.fact_returns;
GO

------------------------------------------------------------




