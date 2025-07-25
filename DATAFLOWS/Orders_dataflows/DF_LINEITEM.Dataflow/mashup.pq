[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "LINEITEM_DataDestination", IsNewTarget = true], Settings = [Kind = "Manual", AllowCreation = true, ColumnSettings = [Mappings = {[SourceColumnName = "L_ORDERKEY", DestinationColumnName = "L_ORDERKEY"], [SourceColumnName = "L_PARTKEY", DestinationColumnName = "L_PARTKEY"], [SourceColumnName = "L_SUPPKEY", DestinationColumnName = "L_SUPPKEY"], [SourceColumnName = "L_LINENUMBER", DestinationColumnName = "L_LINENUMBER"], [SourceColumnName = "L_QUANTITY", DestinationColumnName = "L_QUANTITY"], [SourceColumnName = "L_EXTENDEDPRICE", DestinationColumnName = "L_EXTENDEDPRICE"], [SourceColumnName = "L_DISCOUNT", DestinationColumnName = "L_DISCOUNT"], [SourceColumnName = "L_TAX", DestinationColumnName = "L_TAX"], [SourceColumnName = "L_RETURNFLAG", DestinationColumnName = "L_RETURNFLAG"], [SourceColumnName = "L_LINESTATUS", DestinationColumnName = "L_LINESTATUS"], [SourceColumnName = "L_SHIPDATE", DestinationColumnName = "L_SHIPDATE"], [SourceColumnName = "L_COMMITDATE", DestinationColumnName = "L_COMMITDATE"], [SourceColumnName = "L_RECEIPTDATE", DestinationColumnName = "L_RECEIPTDATE"], [SourceColumnName = "L_SHIPINSTRUCT", DestinationColumnName = "L_SHIPINSTRUCT"], [SourceColumnName = "L_SHIPMODE", DestinationColumnName = "L_SHIPMODE"], [SourceColumnName = "L_COMMENT", DestinationColumnName = "L_COMMENT"]}], DynamicSchema = false, UpdateMethod = [Kind = "Replace"], TypeSettings = [Kind = "Table"]]]}]
shared LINEITEM = let
  Source = Snowflake.Databases("rbipgdv-nf45419.snowflakecomputing.com", p_compute, [Role = null, CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null]),
  #"Navigation 1" = Source{[Name = p_database, Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "GOLD_POWERBI", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "LINEITEM", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared p_database = "DWH_PROD" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared p_compute = "COMPUTE_WH" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text];
shared LINEITEM_DataDestination = let
  Pattern = Fabric.Warehouse([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[warehouseId = "996e4485-661e-4a94-ae04-026b3e216515"]}[Data],
  TableNavigation = Navigation_2{[Item = "fact_LINEITEM", Schema = "dbo"]}?[Data]?
in
  TableNavigation;
