CREATE MASTER KEY ENCRYPTION BY password ='123456789qwe@' ;

CREATE DATABASE SCOPED CREDENTIAL credential_ahmed
WITH IDENTITY = 'managed identity'   ;

CREATE EXTERNAL DATA SOURCE source_silver
with 
(

    LOCATION ='https://awdatalakestoragep.blob.core.windows.net/silver',
    CREDENTIAL= credential_ahmed
);

CREATE EXTERNAL DATA SOURCE source_gold
with 
(

    LOCATION ='https://awdatalakestoragep.blob.core.windows.net/gold',
    CREDENTIAL= credential_ahmed
);

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
      FORMAT_TYPE= PARQUET,
      DATA_COMPRESSION ='org.apache.hadoop.io.compress.SnappyCodec'

);
-----------------------------------------------------
----create external table extsales
-----------------------------------------------------
create external table gold.extsales
WITH
(

    LOCATION = 'extsales',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.sales;


-----------------------------------------------------
----create external table extcustomers
-----------------------------------------------------
create external table gold.extcustomers
WITH
(

    LOCATION = 'extcustomers',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.customers;
-----------------------------------------------------
----create external table extproducts
-----------------------------------------------------
create external table gold.extproducts
WITH
(

    LOCATION = 'extproducts',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.products;
-----------------------------------------------------
----create external table extreturns
-----------------------------------------------------
create external table gold.extreturns
WITH
(

    LOCATION = 'extreturns',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.returns;
-----------------------------------------------------
----create external table extsubcat
-----------------------------------------------------
create external table gold.extsubcat
WITH
(

    LOCATION = 'extsubcat',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.subcat;
-----------------------------------------------------
----create external table extterritories
-----------------------------------------------------
create external table gold.extterritories
WITH
(

    LOCATION = 'extterritories',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.territories;

-----------------------------------------------------
----create external table ext_Calendar
-----------------------------------------------------
create external table gold.ext_calendar
WITH
(

    LOCATION = 'ext_calendar',
    data_source = source_gold,
    file_format = format_parquet
)
as
select * from gold.calendar;
--------------------------------------------------

