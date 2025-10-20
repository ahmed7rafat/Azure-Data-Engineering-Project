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



SELECT* from gold.extsales
