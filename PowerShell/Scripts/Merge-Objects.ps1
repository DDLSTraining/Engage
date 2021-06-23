<#
.Synopsis
   Merges the properties of the two objects passed to the script.
   This script supports the pipeline.
#>
[CmdletBinding()]
[OutputType([int])]
Param
(
    # The first object to merge.
    [Parameter(Mandatory,Position=0)]
    $Object1,

    # The second object to merge.
    [Parameter(Mandatory,Position=1)]
    $Object2
)

$output = @{}

foreach ($object in ($Object1,$Object2))
{
    foreach ($prop in $object.PSObject.Properties)
    {
            $output[$prop.Name] = $prop.Value            
    }
}

Write-Output -InputObject $output 


