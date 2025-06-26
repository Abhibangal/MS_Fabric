[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "FACTS_STORE_SALES_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared FACTS_STORE_SALES = let
  Source = Snowflake.Databases("wegdzrr-lp32993.snowflakecomputing.com", "compute_wh", [CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null, Role = Role]),
  #"Navigation 1" = Source{[Name = Database, Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "FINANCE", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "FACTS_STORE_SALES", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared FACTS_STORE_SALES_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "943e3efe-6bd0-4744-b09b-91757fe51b28"]}[Data],
  TableNavigation = Navigation_2{[Id = "FACTS_STORE_SALES", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
shared Database = "ODP_DEV" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text, List = {"ODP_DEV", "ODP_PROD"}, DefaultValue = "ODP_DEV"];
shared Role = "REPORTING_DEV" meta [IsParameterQuery = true, IsParameterQueryRequired = true, Type = type text, List = {"REPORTING_DEV", "REPORTING_PROD"}, DefaultValue = "REPORTING_DEV"];
