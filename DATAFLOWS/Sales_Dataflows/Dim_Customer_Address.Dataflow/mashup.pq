[StagingDefinition = [Kind = "FastCopy"]]
section Section1;
[DataDestinations = {[Definition = [Kind = "Reference", QueryName = "DIM_CUSTOMER_ADDRESS_DataDestination", IsNewTarget = true], Settings = [Kind = "Automatic", TypeSettings = [Kind = "Table"]]]}]
shared DIM_CUSTOMER_ADDRESS = let
  Source = Snowflake.Databases("wegdzrr-lp32993.snowflakecomputing.com", "compute_wh", [CreateNavigationProperties = null, ConnectionTimeout = null, CommandTimeout = null, Role = "REPORTING_DEV"]),
  #"Navigation 1" = Source{[Name = "ODP_DEV", Kind = "Database"]}[Data],
  #"Navigation 2" = #"Navigation 1"{[Name = "FINANCE", Kind = "Schema"]}[Data],
  #"Navigation 3" = #"Navigation 2"{[Name = "DIM_CUSTOMER_ADDRESS", Kind = "Table"]}[Data]
in
  #"Navigation 3";
shared DIM_CUSTOMER_ADDRESS_DataDestination = let
  Pattern = Lakehouse.Contents([CreateNavigationProperties = false]),
  Navigation_1 = Pattern{[workspaceId = "4fd53789-e420-4c23-93cb-a80d6886c43d"]}[Data],
  Navigation_2 = Navigation_1{[lakehouseId = "943e3efe-6bd0-4744-b09b-91757fe51b28"]}[Data],
  TableNavigation = Navigation_2{[Id = "DIM_CUSTOMER_ADDRESS", ItemKind = "Table"]}?[Data]?
in
  TableNavigation;
