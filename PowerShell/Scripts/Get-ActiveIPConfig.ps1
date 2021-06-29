<#
.SYNOPSIS
  Returns the network interface details for the interface that
  is being used to route traffic to the internet.

.DESCRIPTION
  On a system with multiple network interfaces it can be difficult
  to determine which interface is being used for connecting to
  other networks or the internet.

  This script returns the primary network interface network details
  by using the routing table and sorting the results based on the
  routing metric.

.EXAMPLE
Get-ActiveIPConfig

Returns the following PSCustomObject:

Description : Intel(R) Ethernet Connection I217-LM
MACAddress  : 34:17:EB:A4:08:13
Address     : 134.30.1.147
NetMask     : 255.255.255.0
Gateway     : 134.30.1.1
DHCPServer  : 134.30.1.1
DNSHostName : Desktop1
DNSDomain   : example.com
DNSSearch   : {example.com}

#>
[CmdletBinding()]
[OutputType([string])]
Param()

function Get-First
{
    [CmdletBinding()]
    [OutputType([string])]
    Param( $IPList )
    [Regex]$reg = "\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}"
    $result = ""
    foreach ($ip in $IPList)
    {
        $match = $reg.Match($ip)
        if ($match.Success)
        {
            $result = $match.Groups[0].Value
            break
        }
    }
    Write-Output -InputObject $result
}

Write-Verbose -Message "Getting the interface index being used by the default route."
$NICIndex = Get-NetRoute -AddressFamily IPv4 -DestinationPrefix "0.0.0.0/0" |
            Sort-Object -Property InterfaceMetric -Top 1 |
            Select-Object -ExpandProperty InterfaceIndex

Write-Verbose -Message "Getting the default route network adapter configuration."
$AdapterConfig = Get-CimInstance -ClassName Win32_NetworkAdapter |
    Where-Object { $_.InterfaceIndex -eq $NICIndex } |
    Get-CimAssociatedInstance -ResultClassName Win32_NetworkAdapterConfiguration

Write-Verbose -Message "Populating a custom PSObject with the desired details."
$ipconfig = [PSCustomObject]@{Description = $AdapterConfig.Description;
                              MACAddress = $AdapterConfig.MACAddress;
                              Address = (Get-First $AdapterConfig.IPAddress);
                              NetMask = (Get-First $AdapterConfig.IPSubnet);
                              Gateway = (Get-First $AdapterConfig.DefaultIPGateway);
                              DHCPServer = $AdapterConfig.DHCPServer;
                              DNSHostName = $AdapterConfig.DNSHostName;
                              DNSDomain = $AdapterConfig.DNSDomain;
                              DNSSearch = $AdapterConfig.DNSDomainSuffixSearchOrder;
                              InterfaceIndex = $NICIndex}

Write-Output -InputObject $ipconfig