[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "SUPPLIER_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "S_SUPPKEY", DestinationColumnName = "S_SUPPKEY"], [SourceColumnName = "S_NAME", DestinationColumnName = "S_NAME"], [SourceColumnName = "S_ADDRESS", DestinationColumnName = "S_ADDRESS"], [SourceColumnName = "S_NATIONKEY", DestinationColumnName = "S_NATIONKEY"], [SourceColumnName = "S_PHONE", DestinationColumnName = "S_PHONE"], [SourceColumnName = "S_ACCTBAL", DestinationColumnName = "S_ACCTBAL"], [SourceColumnName = "S_COMMENT", DestinationColumnName = "S_COMMENT"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared SUPPLIER = let
  Source = Snowflake.Databases("rbipgdv-nf45419.snowflakecomputing.com", p_compute, [Role = null, CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null]),
  #"Navigation 1" = Source{[Name = p_database, Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "GOLD_POWERBI", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "SUPPLIER", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared p_compute = "COMPUTE_WH" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared p_database = "DWH_PROD" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared SUPPLIER_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "996e4485-661e-4a94-ae04-026b3e216515"]}[Data],
  TableNavigation = Navigation_2{[Item = "dim_SUPPLIER", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
