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

