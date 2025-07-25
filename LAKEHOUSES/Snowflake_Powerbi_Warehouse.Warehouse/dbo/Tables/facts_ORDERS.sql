CREATE TABLE [dbo].[facts_ORDERS] (

	[O_ORDERKEY] decimal(38,6) NULL, 
	[O_CUSTKEY] decimal(38,6) NULL, 
	[O_ORDERSTATUS] varchar(8000) NULL, 
	[O_TOTALPRICE] decimal(38,6) NULL, 
	[O_ORDERDATE] date NULL, 
	[O_ORDERPRIORITY] varchar(8000) NULL, 
	[O_CLERK] varchar(8000) NULL, 
	[O_SHIPPRIORITY] decimal(38,6) NULL, 
	[O_COMMENT] varchar(8000) NULL
);