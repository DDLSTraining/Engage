function Find-ValidSubnet {
  <#
  .SYNOPSIS
    Takes an IPv4 network address and creates subnets based on hosts and networks needed. 
  .DESCRIPTION
    This command calculates all possible subnet masks that will accommodate the required
    subnets and hosts/subnet. Once the masks are found it will then produce all of the possible
    subnet ranges per subnet mask. It also has the option to show only the smallest subnets in
    regard to hosts/subnet (largest CIDR mask). These is also an option to show all subnets and
    this is very useful when trying to plan for VLSM subnets.
    
    This is a basic example:

  Find-ValidSubnet -CIDRSubnetAddress 172.16.0.0/16 -SubnetsRequired 4 -HostsPerSubnetRequired 6000 | Format-Table -GroupBy Mask
  
     Mask: 18
  
  Mask SubnetID      FirstValidIP  LastValidIP     BroadcastIP     HostsPerSubnet Subnet TotalSubnets
  ---- --------      ------------  -----------     -----------     -------------- ------ ------------
    18 172.16.0.0   172.16.0.1   172.16.63.254  172.16.63.255           16382      1            4
    18 172.16.64.0  172.16.64.1  172.16.127.254 172.16.127.255          16382      2            4
    18 172.16.128.0 172.16.128.1 172.16.191.254 172.16.191.255          16382      3            4
    18 172.16.192.0 172.16.192.1 172.16.255.254 172.16.255.255          16382      4            4
  
     Mask: 19
  
  Mask SubnetID      FirstValidIP  LastValidIP     BroadcastIP     HostsPerSubnet Subnet TotalSubnets
  ---- --------      ------------  -----------     -----------     -------------- ------ ------------
    19 172.16.0.0   172.16.0.1   172.16.31.254  172.16.31.255            8190      1            8
    19 172.16.32.0  172.16.32.1  172.16.63.254  172.16.63.255            8190      2            8
    19 172.16.64.0  172.16.64.1  172.16.95.254  172.16.95.255            8190      3            8
    19 172.16.96.0  172.16.96.1  172.16.127.254 172.16.127.255           8190      4            8
    19 172.16.128.0 172.16.128.1 172.16.159.254 172.16.159.255           8190      5            8
    19 172.16.160.0 172.16.160.1 172.16.191.254 172.16.191.255           8190      6            8
    19 172.16.192.0 172.16.192.1 172.16.223.254 172.16.223.255           8190      7            8
    19 172.16.224.0 172.16.224.1 172.16.255.254 172.16.255.255           8190      8            8

    It will also make sure the original network address is a network address and if it is not it
    will AND the given address with the oiginal mask to find the network address. 
    It is suggested that the output be formated into a table with a -groupby Mask parameter. 
  .EXAMPLE
    Find-ValidSubnet -CIDRSubnetAddress 172.16.0.0/16 -SubnetsRequired 4 -HostsPerSubnetRequired 4000  | Format-Table -GroupBy Mask
    Using the 172.16.0.0/16 network as a base this will find all subnet masks that will allow
    for a minimum of 4 subnets, while still allowing 4000 hosts per subnet. The subnets willl be
    listed for each subnet mask discovered
  .EXAMPLE
    Find-ValidSubnet -CIDRSubnetAddress 192.168.20.0/24 -AllSubnetsVLSM | Format-Table -GroupBy Mask
    Using the 192.168.20.0/24 network as a base this will find all subnets that are possible, this is very
    handy when trying to plan VLSM subnets.
  .PARAMETER CIDRSubnetAddress
    This parameter requires the network address to be entered with the CIDR mask as well. 
    In this format 172.16.0.0/16
  .PARAMETER SubnetsRequired
    This parameter declares how many subnets the CIDR network will need to be broken into as a minimum.
    Because this is a minimum, this command will also look for all valid subnets as long as it still
    allows for the number of hosts per subnet, -HostsPerSubnetRequired parameter value.
  .PARAMETER HostsPerSubnetRequired
    This parameter dictates the minimum amount of hosts that are required per subnet.
  .PARAMETER SmallestSubnets
    This parameter only shows the smallest subnets, those with the biggest subnet mask value.
  .PARAMETER LargestSubnets
    This parameter only shows the largest subnets, those with the smallest subnet mask value.
  .PARAMETER AllSubnetsVLSM
    This parameter show all possible subnets which can be very handy when planning VLSM subnets.
  .NOTES
    General notes
      Created by:    Brent Denny
      Created on:    09 Mar 2021
      Last Modified: 26 Mar 2021
  #>
  [cmdletbinding(DefaultParameterSetName='Default',PositionalBinding=$false)]
  Param (
    [Parameter(Mandatory=$true,ParameterSetName='VLSM')]
    [Parameter(Mandatory=$true,ParameterSetName='Subnet')]
    [string]$CIDRSubnetAddress,
    [Parameter(Mandatory=$true,ParameterSetName='Subnet')]
    [int]$SubnetsRequired,
    [Parameter(Mandatory=$true,ParameterSetName='Subnet')]
    [int]$HostsPerSubnetRequired,
    [Parameter(ParameterSetName='Subnet')]
    [switch]$SmallestSubnets,
    [Parameter(ParameterSetName='Subnet')]
    [switch]$LargestSubnets,
    [Parameter(ParameterSetName='VLSM')]
    [switch]$AllSubnetsVLSM
  )

  function ConvertTo-IPAddressObject {
    [cmdletbinding(DefaultParameterSetName='Default')]
    Param (
      [int]$BitCount,
      [Parameter(ParameterSetName='IPAddress')]
      [string]$IPAddress,
      [Parameter(ParameterSetName='DecAddress')]
      [int64]$DecAddress
    )
    # this function will take a bit count, IPaddress or decimal address, and 
    # convert any of them into an object that contains a forward and reverse versions 
    # of the IPAddresses and their decimal values
    if ($PSCmdlet.ParameterSetName -eq 'Default') {
      $BinaryString = '1' * $BitCount + '0' * (32 - $BitCount)
      $IPObj = [ipaddress]([convert]::ToInt64($BinaryString,2))
      $FwdAddrIPObj = [ipaddress]($IPObj.IPAddressToString -replace '^(\d+)\.(\d+)\.(\d+)\.(\d+)$','$4.$3.$2.$1')
      $RevAddrIPObj = $IPObj
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'IPAddress') {
      $FwdAddrIPObj = [ipaddress]$IPAddress
      $RevAddrIPObj = [ipaddress]($IPAddress -replace '^(\d+)\.(\d+)\.(\d+)\.(\d+)$','$4.$3.$2.$1')
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'DecAddress') {
      $IPObj = [ipaddress]$DecAddress
      $FwdAddrIPObj = [ipaddress]($IPObj.IPAddressToString -replace '^(\d+)\.(\d+)\.(\d+)\.(\d+)$','$4.$3.$2.$1')
      $RevAddrIPObj = $IPObj
    }
    $ObjProp = [ordered]@{
      FwdAddrIP = $FwdAddrIPObj.IPAddressToString
      FwdAddrDec = $FwdAddrIPObj.Address
      RevAddrIP = $RevAddrIPObj.IPAddressToString
      RevAddrDec = $RevAddrIPObj.Address 
    }
    New-object -TypeName psobject -Property $ObjProp
  }

  function Find-IPSubnetRange {
    [cmdletbinding()]
    Param (
      [string]$IPAddress,
      [int]$InitialMask,
      [int]$SubnetMask
    )
    # This function will find all of the valid subnets for a subnetted mask, and list the following
    # Mask,Subnet,FirstValidIP,LastValidIP,BroadcastIP,HostsPerSubnet and Subnet Number
    $MaxSubnetIndex = [math]::Pow(2,$SubnetMask - $InitialMask) - 1
    $JumpValue = [math]::Pow(2,8-$SubnetMask % 8)
    $JumpIndex = [math]::Truncate($SubnetMask / 8)
    if ($JumpValue -eq 256) {
      $JumpValue = 1
      $JumpIndex = $JumpIndex - 1
    }
    [int[]]$JumpIPArray = 0,0,0,0
    $JumpIPArray[$JumpIndex] = $JumpValue
    $JumpIPAddr = $JumpIPArray -join '.' 
    $JumpIPAddressSet = ConvertTo-IPAddressObject -IPAddress $JumpIPAddr
    $IPAddressSet = ConvertTo-IPAddressObject -IPAddress $IPAddress
    foreach ($SubnetIndex in (0..$MaxSubnetIndex)) {
      # The ...RevDec refers to the IP addresses decimal value, it 'turns out' that the 
      # [IPAddress] object reverses the decimal value of the IP, so by reversing the
      # reverse we get the actual decimal value. This is why you see this everywhere 
      # within this function
      $ThisSubnetRevDec = $IPAddressSet.RevAddrDec + ($SubnetIndex * $JumpIPAddressSet.RevAddrDec)
      $ThisSubnetSet = ConvertTo-IPAddressObject -DecAddress $ThisSubnetRevDec
      $FirstValidRevDec = $ThisSubnetRevDec + 1
      $LastValidRevDec  = $ThisSubnetRevDec + $JumpIPAddressSet.RevAddrDec - 2
      $BroadCastRevDec  = $ThisSubnetRevDec + $JumpIPAddressSet.RevAddrDec - 1
      $FirstValidSet = ConvertTo-IPAddressObject -DecAddress $FirstValidRevDec
      $LastValidSet = ConvertTo-IPAddressObject -DecAddress $LastValidRevDec
      $BroadCastSet = ConvertTo-IPAddressObject -DecAddress $BroadCastRevDec
      $ObjProp = [ordered]@{
        Mask           = $SubnetMask
        SubnetID       = $ThisSubnetSet.FwdAddrIP
        FirstValidIP   = $FirstValidSet.FwdAddrIP
        LastValidIP    = $LastValidSet.FwdAddrIP
        BroadcastIP    = $BroadCastSet.FwdAddrIP
        HostsPerSubnet = [math]::Pow(2,32 -$SubnetMask) - 2
        Subnet         = $SubnetIndex + 1
        TotalSubnets   = $MaxSubnetIndex + 1
      }
      New-Object -TypeName psobject -Property $ObjProp
    } 
  }

  ## MAIN Function BODY
  if ($AllSubnetsVLSM -eq $true) {
    $SubnetsRequired = 1
    $HostsPerSubnetRequired = 1
  }
  $BadEntry = $false
  if ($PSCmdlet.ParameterSetName -eq 'VLSM' -and  $CIDRSubnetAddress -eq '') {$BadEntry = $true}
  elseif ($CIDRSubnetAddress -eq '' -or $SubnetsRequired -eq 0 -or $SubnetsRequired -gt 4194304 -or $HostsPerSubnetRequired -gt 16777214) {$BadEntry = $true}
  if ($BadEntry -eq $true) {
    Write-Warning "Invalid or incomplete information was entered for this command, Please use Get-Help -Full $($MyInvocation.InvocationName) to learn more about how to run this command" 
    break
  }
  $CIDRParts    = $CIDRSubnetAddress -split '\/'
  $SubnetID     = $CIDRParts[0] -as [string]
  $InitialMask  = $CIDRParts[1] -as [int]
  $HostBitsRequired = [math]::Ceiling([math]::Log($HostsPerSubnetRequired+2)/[math]::log(2))  # +2 to cater for NetworkId and BroadcastID addresses
  $NetworkBitsRequired = [math]::Ceiling([math]::Log($SubnetsRequired)/[math]::log(2))
  $TotalBitsRequired = $InitialMask + $HostBitsRequired + $NetworkBitsRequired 
  # Make sure the given IP addres is an IP Address 
  if ($CIDRSubnetAddress -notmatch '^([1-9]|[1-9][0-9]|1[01][0-9]|12[0-6]|12[89]|1[3-9][0-9]|2[0-2][0-3])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}\/([2-9]|[12][0-9]|30)$') {
    write-warning "$CIDRSubnetAddress - is not a valid address please enter the address and mask, for example: 164.12.0.0/16"
    break
  }
  elseif ($TotalBitsRequired -gt 32) {
    Write-Warning "The solution you requested requires $TotalBitsRequired bits in the address, we only have 32 bits in IPv4"
    break
  }
  else { 
    $MaskSet   = ConvertTo-IPAddressObject -BitCount $InitialMask
    $SubnetSet = ConvertTo-IPAddressObject -IPAddress $SubnetID
    # ANDing the Network address with original mask to produce a real network address
    # this is just in case an address that was entered was a host address and 
    # not the network address.
    $NetBinAndMaskDec  = $SubnetSet.RevAddrDec -band $MaskSet.RevAddrDec
    # Fixed IP uses ANDing to make sure the subnet address is the actual address of the subnet and not a host address 
    # the subnet.
    $ActualNetworkAddrSet = ConvertTo-IPAddressObject -DecAddress $NetBinAndMaskDec
    $SubnetingBitsArray = 0..(32 - $TotalBitsRequired ) | ForEach-Object {
      # Finding how many subnet bits are required for the number of subnets requested
      [math]::Ceiling([math]::Log($SubnetsRequired)/[math]::log(2)) + $_ + $InitialMask
    }
    $SubnetResults = foreach ($SubnettedBits in $SubnetingBitsArray) {
      # Go find the valid subnet ranges per valid subnet mask
      Find-IPSubnetRange -IPAddress $ActualNetworkAddrSet.FwdAddrIP -InitialMask $InitialMask -SubnetMask $SubnettedBits | 
       Where-Object {$_.HostsPerSubnet -ge $HostsPerSubnetRequired -and $_.TotalSubnets -ge $SubnetsRequired}
    }
    if ($SmallestSubnets -eq $true) {$SubnetResults | Where-Object {$_.Mask -eq $SubnetResults[-1].Mask}}
    if ($LargestSubnets -eq $true) {$SubnetResults | Where-Object {$_.Mask -eq $SubnetResults[0].Mask}}
    if ($SmallestSubnets -ne $true -and $LargestSubnets -ne $true) {$SubnetResults}
  }
}

function Show-IPFwdAndRev {
  <#
  .SYNOPSIS
    Given an IP address in one of different forms it shows forward and reverse IP address information
  .DESCRIPTION
    You can enter the IP address in one of five forms:
      Reverse IP Address
      Forward IP Address
      Reverse Decimal IP Address
      Forward Decimal IP Address
      CIDR Mask integer
  .EXAMPLE
    Show-IPFwdAndRev -FwdIPAddress 192.168.20.13
    This will show the following information:
     ForwardIP : 192.168.20.13
     FwdDecIP  : 3232240653
     FwdBinary : 11000000101010000001010000001101
     FwdBinaryGroups :  11000000 10101000 00010100 00001101
     ReverseIP : 13.20.168.192
     RevDecIP  : 219457728
     RevBinary : 00001101000101001010100011000000
     FwdBinaryGroups :  00001101 00010100 10101000 11000000     
  .PARAMETER RevIPAddress
    This will take an IP that has been reversed and show all forms of that IP address
  .PARAMETER FwdIPAddress
    This will take an IP and show all forms of that IP address
  .PARAMETER FwdDecIP
    This will take the decimal equivilent of the IP address and show all forms of the IP address
  .PARAMETER RevDecIP
    This will take the reverse decimal equivilent of the IP address and show all forms of the IP address
  .PARAMETER CIDRMask
    This will take a CIDR Mask integer and show it in all the address forms
  .NOTES
    General notes
      Created  by: Brent Denny
      Created  on: 25 Mar 2021
      Modified on: 25 Mar 2021
  #>
  [CmdletBinding(DefaultParameterSetName='Default')]
  Param (
    [Parameter(ParameterSetName='ReverseIP')]
    [string]$RevIPAddress,
    [Parameter(ParameterSetName='ForwardIP')]
    [string]$FwdIPAddress,
    [Parameter(ParameterSetName='ForwardDecIP')]
    [string]$FwdDecIP,
    [Parameter(ParameterSetName='ReverseDecIP')]
    [string]$RevDecIP,
    [Parameter(ParameterSetName='CIDRMask')]
    [int]$CIDRMask
  )

  if ($PSCmdlet.ParameterSetName -eq 'ReverseIP') {
    $IPOctetsArray = $RevIPAddress -split '\.'
    $FwdArray = 3..0
    $RevArray = 0..3
  }
  elseif ($PSCmdlet.ParameterSetName -eq 'ForwardIP')  {
    $IPOctetsArray = $FwdIPAddress -split '\.'
    $FwdArray = 0..3
    $RevArray = 3..0
  }
  elseif ($PSCmdlet.ParameterSetName -eq 'ForwardDecIP') {
    $IPObj = [ipaddress]$FwdDecIP
    $IPOctetsArray = $IPObj.IPAddressToString -split '\.'
    $FwdArray = 0..3
    $RevArray = 3..0
  }
  elseif ($PSCmdlet.ParameterSetName -eq 'ReverseDecIP') {
    $IPObj = [ipaddress]$RevDecIP
    $IPOctetsArray = $IPObj.IPAddressToString -split '\.'
    $FwdArray = 3..0
    $RevArray = 0..3    
  }
  elseif ($PSCmdlet.ParameterSetName -eq 'CIDRMask') {
    $BinaryMask    = ('1' * $CIDRMask) + ('0' * (32 - $CIDRMask))
    $DecimalMask   = [convert]::ToInt64($BinaryMask,2)
    $IPObj = [ipaddress]$DecimalMask
    $IPOctetsArray = $IPObj.IPAddressToString -split '\.'
    $FwdArray = 3..0
    $RevArray = 0..3    
  }
  $FwdIP = $IPOctetsArray[$FwdArray] -join '.'
  $FwdBinary = ($FwdArray | ForEach-Object {
    $Bin = [convert]::ToString($IPOctetsArray[$_],2)
    ('0' * (8 - $Bin.Length)) + $Bin
  }) -join ''
  $RevIP = $IPOctetsArray[$RevArray] -join '.'
  $RevBinary = ($RevArray | ForEach-Object {
    $Bin = [convert]::ToString($IPOctetsArray[$_],2)
    ('0' * (8 - $Bin.Length)) + $Bin
  }) -join ''
  $FnObjProp = [ordered]@{
    ForwardIP = $FwdIP
    FwdDecIP  = ([ipaddress]$RevIP).Address
    FwdBinary = $FwdBinary
    FwdBinaryGroups   = $FwdBinary -replace '(\d{8})(\d{8})(\d{8})(\d{8})','$1 $2 $3 $4'
    ReverseIP = $RevIP
    RevDecIP  = ([ipaddress]$FwdIP).Address
    RevBinary = $RevBinary
    RevBinaryGroups   = $RevBinary -replace '(\d{8})(\d{8})(\d{8})(\d{8})','$1 $2 $3 $4'
  }
  New-Object -TypeName psobject -Property $FnObjProp
}

function Convert-CIDRMask {
  <#
  .SYNOPSIS
    Takes a CIDR subnet mask integer and displays it in many different formats
  .DESCRIPTION
    Using the CIDR mask provided, this will convert it to the following formats:
      CIDR Mask
      Binary Mask
      IPV4 Mask (forward and reverse)
      Decimal Mask (forward and reverse)
      Jump information (the count from subnet to subnet)
  .EXAMPLE
    Convert-CIDRMask -CIDRMask 20
    This would produce this output, the reverse values are useful in PowerShell IP calulations
      CidrMask       : 20
      BinaryMask     : 11111111111111111111000000000000
      BinaryGroups   : 11111111 11111111 11110000 00000000
      IPv4FwdMask    : 255.255.240.0
      DecimalFwdMask : 4294963200
      IPv4RevMask    : 0.240.255.255
      DecimalRevMask : 15794175
      JumpIPs        : 0.0.16.0
      JumpDecIP      : 4096
      JumpRevIPs     : 0.16.0.0
      JumpDecRevIP   : 1048576
      JumpValue      : 16
  .PARAMETER CIDRMask
    Enter an integer for the CIDR subnet mask, for example if the mask is 255.255.240.0 the 
    mask you would enter would be 20.
  .PARAMETER IPV4Mask
    Enter an IPV4 subnet mask, for example 255.255.240.0 
  .NOTES
    General notes
      Created  by: Brent Denny
      Created  on: 25 Mar 2021
      Modified on: 25 Mar 2021
  #>
  [cmdletbinding(DefaultParameterSetName='default')]
  Param (
    [Parameter(ParameterSetName='CIDR')]
    [int]$CIDRMask,
    [Parameter(ParameterSetName='IP')]
    [string]$IPV4Mask
  )
  
  if ($PSCmdlet.ParameterSetName -eq 'IP') {
    if ($IPV4Mask -notmatch '^(255\.(0|128|192|224|240|248|252|254|255)(\.0){2}|(255\.){2}(0|128|192|224|240|248|252|254|255)\.0|(255\.){3}(0|128|192|224|240|248|252|254|255))$') {
      Write-Warning 'Not a valid subnet mask'
      break
    }
    $Binary = (Show-IPFwdAndRev -FwdIPAddress $IPV4Mask).FwdBinary
    $CIDRMask = ($Binary -replace '^(1+)0+$','$1').length
  }
  else {
    if ($CIDRMask -notin @(8..30)) {
      Write-Warning 'Not a valid subnet mask'
      break
    }

  }
    $IPAddrInfo = Show-IPFwdAndRev -CIDRMask $CIDRMask
    $JumpRevDec = (Show-IPFwdAndRev -CIDRMask ($CIDRMask)).RevDecIP - (Show-IPFwdAndRev -CIDRMask ($CIDRMask-1)).RevDecIP 
    $JumpInfo   = Show-IPFwdAndRev -RevDecIP $JumpRevDec 
    $JumpVal = [math]::Pow(2,(8-($CIDRMask % 8)))
  $FnObjProp = [ordered]@{
    CidrMask       = $CIDRMask
    BinaryMask     = $IPAddrInfo.FwdBinary
    BinaryGroups   = $IPAddrInfo.FwdBinary -replace '(\d{8})(\d{8})(\d{8})(\d{8})','$1 $2 $3 $4'
    IPv4FwdMask    = $IPAddrInfo.ForwardIP
    DecimalFwdMask = $IPAddrInfo.FwdDecIP
    IPv4RevMask    = $IPAddrInfo.ReverseIP
    DecimalRevMask = $IPAddrInfo.RevDecIP
    JumpIPs        = $JumpInfo.ForwardIP
    JumpDecIP      = $JumpInfo.FwdDecIP
    JumpRevIPs     = $JumpInfo.ReverseIP
    JumpDecRevIP   = $JumpInfo.RevDecIP
    JumpValue      = $JumpVal
  }
  New-Object -TypeName psobject -Property $FnObjProp
}

function New-SubnetPSSessions {
  <#
  .SYNOPSIS
    Creates PS Sessions with every host in subnet
  .DESCRIPTION
    Creates PS sessions with all machines that are in the subnet
  .EXAMPLE
    New-SubnetPSSessions
    After the command runs use $Sessions = Get-PSSession to collect the sessions into a single variable
  .NOTES
    General notes
      Created  by: Brent Denny
      Created  on: 25 Mar 2021
      Modified on: 25 Mar 2021
  #>
  Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value * -Force
  $MyIp = ((ipconfig /all).trim() |  Select-String -Pattern '^IPV4 Address' ) -replace '(^.+\:\s|\(Preferred\))','' | Sort-Object @{e={($_ -replace '.*\.','') -as [int] }}
  $MySubnetMask = ((ipconfig /all).trim() |  Select-String -Pattern '^Subnet Mask' ) -replace '^.+\:\s','' 
  $IPRawText = (ipconfig /all).trim() |  Select-String -Pattern '^(DHCP Server|Default Gateway|DNS Servers|IPV4 Address)' 
  $IPArrayToExclude = $IPRawText -replace '(^.+\:\s|\(Preferred\))','' | Sort-Object @{e={($_ -replace '.*\.','') -as [int] }}
  $Mask = (Convert-CIDRMask -IPV4Mask $MySubnetMask).CIDRMask
  $MaskFormats = Convert-CIDRMask -CIDRMask $Mask
  $JumpSize = $MaskFormats.JumpValue
  $ValidIPJump = $JumpSize - 2
  $IP = [ipaddress]$MyIp
  $DecSubnetID = $IP.Address -band $MaskFormats.DecimalRevMask
  $SubnetIDIP = Show-IPFwdAndRev -FwdIPAddress ([ipaddress]$DecSubnetID).IPAddressToString
  $FirstDecIP = [ipaddress](1 + $SubnetIDIP.FwdDecIP)
  $FirstIP = Show-IPFwdAndRev -RevIPAddress $FirstDecIP.IPAddressToString
  $ClassRoomIPs = foreach ($LastOctet in (1..$ValidIPJump)) {
    $NewIP = $FirstIP.ForwardIP -replace '\.\d{1,3}$',".$LastOctet"
    if ($NewIP -notin $IPArrayToExclude) { $NewIP }
  }
  New-PSSession -ComputerName $ClassRoomIPs *> $null
}