CREATE TABLE [dbo].[fact_LINEITEM] (

	[L_ORDERKEY] decimal(38,6) NULL, 
	[L_PARTKEY] decimal(38,6) NULL, 
	[L_SUPPKEY] decimal(38,6) NULL, 
	[L_LINENUMBER] decimal(38,6) NULL, 
	[L_QUANTITY] decimal(38,6) NULL, 
	[L_EXTENDEDPRICE] decimal(38,6) NULL, 
	[L_DISCOUNT] decimal(38,6) NULL, 
	[L_TAX] decimal(38,6) NULL, 
	[L_RETURNFLAG] varchar(8000) NULL, 
	[L_LINESTATUS] varchar(8000) NULL, 
	[L_SHIPDATE] date NULL, 
	[L_COMMITDATE] date NULL, 
	[L_RECEIPTDATE] date NULL, 
	[L_SHIPINSTRUCT] varchar(8000) NULL, 
	[L_SHIPMODE] varchar(8000) NULL, 
	[L_COMMENT] varchar(8000) NULL
);