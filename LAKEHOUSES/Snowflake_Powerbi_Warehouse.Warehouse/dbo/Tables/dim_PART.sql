CREATE TABLE [dbo].[dim_PART] (

	[P_PARTKEY] decimal(38,6) NULL, 
	[P_NAME] varchar(8000) NULL, 
	[P_MFGR] varchar(8000) NULL, 
	[P_BRAND] varchar(8000) NULL, 
	[P_TYPE] varchar(8000) NULL, 
	[P_SIZE] decimal(38,6) NULL, 
	[P_CONTAINER] varchar(8000) NULL, 
	[P_RETAILPRICE] decimal(38,6) NULL, 
	[P_COMMENT] varchar(8000) NULL
);