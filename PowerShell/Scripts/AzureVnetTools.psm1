function Get-AzPeeringType {
  <#
  .SYNOPSIS
    Lists all of the Azure virtual networks peerings and determines their type
  .DESCRIPTION
    This cmdlet finds all of the virtual networks that have peerings and 
    determines if the peering is a global or regional type of peering. 
    It will also show Virtual Networks that do not have any peerings as 
    well. 
    There are restrictions on what you can do with a global peering 
    so it is important to know which peering is what type.
    This command will prompt you if you need to login to Azure via a 
    Connect-AzAccount command
    You cannot use Global VNet peering to communicate with VIPs of 
    load balancers in another region. VIP communication requires source IP
    to be on the same VNet as the LB IP: Resources in one virtual network 
    cannot communicate with the IP address of an Azure internal load balancer 
    in the peered virtual network.
  .EXAMPLE
    Get-AzPeeringType
    This will show all peerings (Global, Regional and NoPeering).
  .EXAMPLE
    Get-AzPeeringType -PeeringFilter Global
    This will only show peerings of a Global type   
  .EXAMPLE
    Get-AzPeeringType -PeeringFilter NoPeering
    This will only show VNets that do not have any peering configured       
  .PARAMETER PeeringFilter
    This will filter the peerings so that either a single peering type
    is shown or all are shown. The values for the PeeringFilter are:
    Regional - Shows only Regional
    Global - Shows only Global
    All - Shows all types of peering
    NoPeering - Shows only VNets with no peerings 
  .NOTES
    General notes
      Created by: Brent Denny
      Created on: 6 May 2020
      Last Modified: 1 Jul 2020
  #>
  [cmdletbinding()]
  Param(
    [ValidateSet('Regional','Global','All','NoPeering')]
    [string]$PeeringFilter = 'All'
  )
  try {Get-AzSubscription -ErrorAction Stop > $null}
  catch {Connect-AzAccount}
  try {
    $VNets = Get-AzVirtualNetwork -ErrorAction Stop
    foreach ($VNet in $VNets){
      if ($VNet.VirtualNetworkPeerings.Count -ge 1) {
        $Peerings = $VNet.VirtualNetworkPeerings
        foreach ($Peering in $Peerings) {
          $PeerID = $Peering.remotevirtualnetwork.Id
          $PeerName = $PeerID -replace '.+\/(.+)$','$1'
          $PeerVNetInfo = $VNets | Where-Object {$_.Id -eq $PeerID}
          $PeerVNetLocation = $PeerVNetInfo.Location
          if ($VNet.Location -eq $PeerVNetLocation) {$PeerType = 'Regional'}
          else {$PeerType = 'Global'}
          if ($PeeringFilter -eq $PeerType -or $PeeringFilter -eq 'All') {
            $Hash = [ordered]@{
              VNetName = $VNet.Name
              ResourceGroup = $VNet.ResourceGroupName
              VNetLocation = $VNet.Location
              PeeringVNet = $PeerName
              PeeringVNetLocation = $PeerVNetLocation
              PeeringType = $PeerType
              VNetID = $VNet.Id
            }
            New-Object -TypeName psobject -Property $Hash   
          }
        }
      }
      else {
        if ($PeeringFilter -eq 'NoPeering' -or $PeeringFilter -eq 'All') {
          $Hash = [ordered]@{
            VNetName = $VNet.Name
            ResourceGroup = $VNet.ResourceGroupName
            VNetLocation = $VNet.Location
            PeeringVNet = 'No Peerings'
            PeeringVNetLocation = 'N/A'
            PeeringType = 'N/A'
            VNetID = $VNet.Id
          }
          New-Object -TypeName psobject -Property $Hash    
        }       
      }  
    }
  }  
  catch { Write-Warning 'An error occured trying to access the Virtual Networks'}
}