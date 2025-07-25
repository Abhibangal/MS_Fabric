[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "CUSTOMER_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "C_CUSTKEY", DestinationColumnName = "C_CUSTKEY"], [SourceColumnName = "C_NAME", DestinationColumnName = "C_NAME"], [SourceColumnName = "C_ADDRESS", DestinationColumnName = "C_ADDRESS"], [SourceColumnName = "C_NATIONKEY", DestinationColumnName = "C_NATIONKEY"], [SourceColumnName = "C_PHONE", DestinationColumnName = "C_PHONE"], [SourceColumnName = "C_ACCTBAL", DestinationColumnName = "C_ACCTBAL"], [SourceColumnName = "C_MKTSEGMENT", DestinationColumnName = "C_MKTSEGMENT"], [SourceColumnName = "C_COMMENT", DestinationColumnName = "C_COMMENT"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared CUSTOMER = let
  Source = Snowflake.Databases("rbipgdv-nf45419.snowflakecomputing.com", p_compute, [Role = null, CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null]),
  #"Navigation 1" = Source{[Name = p_database, Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "GOLD_POWERBI", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "CUSTOMER", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared p_database = "DWH_PROD" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared p_compute = "COMPUTE_WH" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared CUSTOMER_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "996e4485-661e-4a94-ae04-026b3e216515"]}[Data],
  TableNavigation = Navigation_2{[Item = "dim_CUSTOMER", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
