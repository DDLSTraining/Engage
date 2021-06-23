<#
.Synopsis
   Retrieves data from an SQL Server.

.DESCRIPTION
   Connects to an SQL Server and runs the supplied query
   against the supplied Database.

.PARAMETER ConnectionString
   Your database connection string.

.PARAMETER Query
   The SQL Query to run against the Database.

.EXAMPLE
   $query = "SELECT * FROM IPSiteMap"
   $cxnString = "<your SQL connection string>"
   Get-SqlData -ConnectionString $cxnString -Query $query
#>

[CmdletBinding()]
[OutputType('System.Data.DataSet')]
param (
    [String]$ConnectionString,
    [string]$Query
)

$connection = New-Object -TypeName System.Data.SqlClient.SqlConnection
$connection.ConnectionString = Get-SqlConnectionString -DatabaseName $DatabaseName
$command = $connection.CreateCommand()
$command.CommandText = $query
$adapter = New-Object -TypeName System.Data.SqlClient.SqlDataAdapter $command
$dataset = New-Object -TypeName System.Data.DataSet
$rows = $adapter.Fill($dataset)
Write-Output -InputObject $dataset.Tables[0]