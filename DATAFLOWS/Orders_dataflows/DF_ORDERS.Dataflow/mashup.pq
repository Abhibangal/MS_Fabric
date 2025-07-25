[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "ORDERS_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "O_ORDERKEY", DestinationColumnName = "O_ORDERKEY"], [SourceColumnName = "O_CUSTKEY", DestinationColumnName = "O_CUSTKEY"], [SourceColumnName = "O_ORDERSTATUS", DestinationColumnName = "O_ORDERSTATUS"], [SourceColumnName = "O_TOTALPRICE", DestinationColumnName = "O_TOTALPRICE"], [SourceColumnName = "O_ORDERDATE", DestinationColumnName = "O_ORDERDATE"], [SourceColumnName = "O_ORDERPRIORITY", DestinationColumnName = "O_ORDERPRIORITY"], [SourceColumnName = "O_CLERK", DestinationColumnName = "O_CLERK"], [SourceColumnName = "O_SHIPPRIORITY", DestinationColumnName = "O_SHIPPRIORITY"], [SourceColumnName = "O_COMMENT", DestinationColumnName = "O_COMMENT"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared ORDERS = let
  Source = Snowflake.Databases("rbipgdv-nf45419.snowflakecomputing.com", p_compute, [Role = null, CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null]),
  #"Navigation 1" = Source{[Name = p_database, Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "GOLD_POWERBI", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "ORDERS", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared p_compute = "COMPUTE_WH" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared p_database = "DWH_PROD" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared ORDERS_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "996e4485-661e-4a94-ae04-026b3e216515"]}[Data],
  TableNavigation = Navigation_2{[Item = "facts_ORDERS", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
