<#
.Synopsis
   Executes a non-query against the an SQL Server.

.DESCRIPTION
   Connects to the SQL Server and runs the supplied query
   against the supplied Database in the connection string.

.PARAMETER ConnectionString
   Your database connection string.

.PARAMETER Query
   The SQL Query to run against the Database.

.EXAMPLE
   $query = "INSERT INTO [Inventory].[dbo].[Computer] ('SerialNumber') VALUES ('123abc')"
   $cxnString = "<your SQL connection string>"
   Set-SqlData -ConnectionString $cxnString -Query $query
#>
[CmdletBinding()]
PARAM
(
    [Parameter(Mandatory)]
    [String]$ConnectionString,

    [Parameter(Mandatory,
        ValueFromPipeline,
        ValueFromPipelineByPropertyName)]
    [string]$Query
)

BEGIN
{
    $connection = New-Object -TypeName System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $ConnectionString
    $command = $connection.CreateCommand()
    $connection.Open()
}

PROCESS
{
    $command.CommandText = $Query
    $command.ExecuteNonQuery()
}

END
{
    $connection.close()
}