[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "REGION_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "R_REGIONKEY", DestinationColumnName = "R_REGIONKEY"], [SourceColumnName = "R_NAME", DestinationColumnName = "R_NAME"], [SourceColumnName = "R_COMMENT", DestinationColumnName = "R_COMMENT"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared REGION = let
  Source = Snowflake.Databases("rbipgdv-nf45419.snowflakecomputing.com", p_compute, [Role = null, CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null]),
  #"Navigation 1" = Source{[Name = p_database, Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "GOLD_POWERBI", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "REGION", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared p_compute = "COMPUTE_WH" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared p_database = "DWH_PROD" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type any];
shared REGION_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "996e4485-661e-4a94-ae04-026b3e216515"]}[Data],
  TableNavigation = Navigation_2{[Item = "dim_REGION", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
