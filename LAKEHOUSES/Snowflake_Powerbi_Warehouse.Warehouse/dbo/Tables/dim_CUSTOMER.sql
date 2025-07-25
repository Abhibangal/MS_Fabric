CREATE TABLE [dbo].[dim_CUSTOMER] (

	[C_CUSTKEY] decimal(38,6) NULL, 
	[C_NAME] varchar(8000) NULL, 
	[C_ADDRESS] varchar(8000) NULL, 
	[C_NATIONKEY] decimal(38,6) NULL, 
	[C_PHONE] varchar(8000) NULL, 
	[C_ACCTBAL] decimal(38,6) NULL, 
	[C_MKTSEGMENT] varchar(8000) NULL, 
	[C_COMMENT] varchar(8000) NULL
);