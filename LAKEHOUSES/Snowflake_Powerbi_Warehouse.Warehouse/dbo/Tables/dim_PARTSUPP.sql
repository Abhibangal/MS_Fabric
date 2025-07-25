CREATE TABLE [dbo].[dim_PARTSUPP] (

	[PS_PARTKEY] decimal(38,6) NULL, 
	[PS_SUPPKEY] decimal(38,6) NULL, 
	[PS_AVAILQTY] decimal(38,6) NULL, 
	[PS_SUPPLYCOST] decimal(38,6) NULL, 
	[PS_COMMENT] varchar(8000) NULL
);