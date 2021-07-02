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
    

     Mask: 18
  
    Mask SubnetID     FirstValidIP LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------     ------------ -----------    -----------    -------------- ------ ------------
      18 172.16.0.0   172.16.0.1   172.16.63.254  172.16.63.255           16382      1            4
      18 172.16.64.0  172.16.64.1  172.16.127.254 172.16.127.255          16382      2            4
      18 172.16.128.0 172.16.128.1 172.16.191.254 172.16.191.255          16382      3            4
      18 172.16.192.0 172.16.192.1 172.16.255.254 172.16.255.255          16382      4            4
    
    
       Mask: 19
    
    Mask SubnetID     FirstValidIP LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------     ------------ -----------    -----------    -------------- ------ ------------
      19 172.16.0.0   172.16.0.1   172.16.31.254  172.16.31.255            8190      1            8
      19 172.16.32.0  172.16.32.1  172.16.63.254  172.16.63.255            8190      2            8
      19 172.16.64.0  172.16.64.1  172.16.95.254  172.16.95.255            8190      3            8
      19 172.16.96.0  172.16.96.1  172.16.127.254 172.16.127.255           8190      4            8
      19 172.16.128.0 172.16.128.1 172.16.159.254 172.16.159.255           8190      5            8
      19 172.16.160.0 172.16.160.1 172.16.191.254 172.16.191.255           8190      6            8
      19 172.16.192.0 172.16.192.1 172.16.223.254 172.16.223.255           8190      7            8
      19 172.16.224.0 172.16.224.1 172.16.255.254 172.16.255.255           8190      8            8
    
    
       Mask: 20
    
    Mask SubnetID     FirstValidIP LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------     ------------ -----------    -----------    -------------- ------ ------------
      20 172.16.0.0   172.16.0.1   172.16.15.254  172.16.15.255            4094      1           16
      20 172.16.16.0  172.16.16.1  172.16.31.254  172.16.31.255            4094      2           16
      20 172.16.32.0  172.16.32.1  172.16.47.254  172.16.47.255            4094      3           16
      20 172.16.48.0  172.16.48.1  172.16.63.254  172.16.63.255            4094      4           16
      20 172.16.64.0  172.16.64.1  172.16.79.254  172.16.79.255            4094      5           16
      20 172.16.80.0  172.16.80.1  172.16.95.254  172.16.95.255            4094      6           16
      20 172.16.96.0  172.16.96.1  172.16.111.254 172.16.111.255           4094      7           16
      20 172.16.112.0 172.16.112.1 172.16.127.254 172.16.127.255           4094      8           16
      20 172.16.128.0 172.16.128.1 172.16.143.254 172.16.143.255           4094      9           16
      20 172.16.144.0 172.16.144.1 172.16.159.254 172.16.159.255           4094     10           16
      20 172.16.160.0 172.16.160.1 172.16.175.254 172.16.175.255           4094     11           16
      20 172.16.176.0 172.16.176.1 172.16.191.254 172.16.191.255           4094     12           16
      20 172.16.192.0 172.16.192.1 172.16.207.254 172.16.207.255           4094     13           16
      20 172.16.208.0 172.16.208.1 172.16.223.254 172.16.223.255           4094     14           16
      20 172.16.224.0 172.16.224.1 172.16.239.254 172.16.239.255           4094     15           16
      20 172.16.240.0 172.16.240.1 172.16.255.254 172.16.255.255           4094     16           16
      
  .EXAMPLE
    Find-ValidSubnet -CIDRSubnetAddress 192.168.20.0/24 -AllSubnetsVLSM | Format-Table -GroupBy Mask
    Using the 192.168.20.0/24 network as a base this will find all subnets that are possible, this is very
    handy when trying to plan VLSM subnets.
    
     Mask: 24
  
    Mask SubnetID     FirstValidIP LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------     ------------ -----------    -----------    -------------- ------ ------------
      24 192.168.20.0 192.168.20.1 192.168.20.254 192.168.20.255            254      1            1
    
    
       Mask: 25
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      25 192.168.20.0   192.168.20.1   192.168.20.126 192.168.20.127            126      1            2
      25 192.168.20.128 192.168.20.129 192.168.20.254 192.168.20.255            126      2            2
    
    
       Mask: 26
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      26 192.168.20.0   192.168.20.1   192.168.20.62  192.168.20.63              62      1            4
      26 192.168.20.64  192.168.20.65  192.168.20.126 192.168.20.127             62      2            4
      26 192.168.20.128 192.168.20.129 192.168.20.190 192.168.20.191             62      3            4
      26 192.168.20.192 192.168.20.193 192.168.20.254 192.168.20.255             62      4            4
    
    
       Mask: 27
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      27 192.168.20.0   192.168.20.1   192.168.20.30  192.168.20.31              30      1            8
      27 192.168.20.32  192.168.20.33  192.168.20.62  192.168.20.63              30      2            8
      27 192.168.20.64  192.168.20.65  192.168.20.94  192.168.20.95              30      3            8
      27 192.168.20.96  192.168.20.97  192.168.20.126 192.168.20.127             30      4            8
      27 192.168.20.128 192.168.20.129 192.168.20.158 192.168.20.159             30      5            8
      27 192.168.20.160 192.168.20.161 192.168.20.190 192.168.20.191             30      6            8
      27 192.168.20.192 192.168.20.193 192.168.20.222 192.168.20.223             30      7            8
      27 192.168.20.224 192.168.20.225 192.168.20.254 192.168.20.255             30      8            8
    
    
       Mask: 28
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      28 192.168.20.0   192.168.20.1   192.168.20.14  192.168.20.15              14      1           16
      28 192.168.20.16  192.168.20.17  192.168.20.30  192.168.20.31              14      2           16
      28 192.168.20.32  192.168.20.33  192.168.20.46  192.168.20.47              14      3           16
      28 192.168.20.48  192.168.20.49  192.168.20.62  192.168.20.63              14      4           16
      28 192.168.20.64  192.168.20.65  192.168.20.78  192.168.20.79              14      5           16
      28 192.168.20.80  192.168.20.81  192.168.20.94  192.168.20.95              14      6           16
      28 192.168.20.96  192.168.20.97  192.168.20.110 192.168.20.111             14      7           16
      28 192.168.20.112 192.168.20.113 192.168.20.126 192.168.20.127             14      8           16
      28 192.168.20.128 192.168.20.129 192.168.20.142 192.168.20.143             14      9           16
      28 192.168.20.144 192.168.20.145 192.168.20.158 192.168.20.159             14     10           16
      28 192.168.20.160 192.168.20.161 192.168.20.174 192.168.20.175             14     11           16
      28 192.168.20.176 192.168.20.177 192.168.20.190 192.168.20.191             14     12           16
      28 192.168.20.192 192.168.20.193 192.168.20.206 192.168.20.207             14     13           16
      28 192.168.20.208 192.168.20.209 192.168.20.222 192.168.20.223             14     14           16
      28 192.168.20.224 192.168.20.225 192.168.20.238 192.168.20.239             14     15           16
      28 192.168.20.240 192.168.20.241 192.168.20.254 192.168.20.255             14     16           16
    
    
       Mask: 29
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      29 192.168.20.0   192.168.20.1   192.168.20.6   192.168.20.7                6      1           32
      29 192.168.20.8   192.168.20.9   192.168.20.14  192.168.20.15               6      2           32
      29 192.168.20.16  192.168.20.17  192.168.20.22  192.168.20.23               6      3           32
      29 192.168.20.24  192.168.20.25  192.168.20.30  192.168.20.31               6      4           32
      29 192.168.20.32  192.168.20.33  192.168.20.38  192.168.20.39               6      5           32
      29 192.168.20.40  192.168.20.41  192.168.20.46  192.168.20.47               6      6           32
      29 192.168.20.48  192.168.20.49  192.168.20.54  192.168.20.55               6      7           32
      29 192.168.20.56  192.168.20.57  192.168.20.62  192.168.20.63               6      8           32
      29 192.168.20.64  192.168.20.65  192.168.20.70  192.168.20.71               6      9           32
      29 192.168.20.72  192.168.20.73  192.168.20.78  192.168.20.79               6     10           32
      29 192.168.20.80  192.168.20.81  192.168.20.86  192.168.20.87               6     11           32
      29 192.168.20.88  192.168.20.89  192.168.20.94  192.168.20.95               6     12           32
      29 192.168.20.96  192.168.20.97  192.168.20.102 192.168.20.103              6     13           32
      29 192.168.20.104 192.168.20.105 192.168.20.110 192.168.20.111              6     14           32
      29 192.168.20.112 192.168.20.113 192.168.20.118 192.168.20.119              6     15           32
      29 192.168.20.120 192.168.20.121 192.168.20.126 192.168.20.127              6     16           32
      29 192.168.20.128 192.168.20.129 192.168.20.134 192.168.20.135              6     17           32
      29 192.168.20.136 192.168.20.137 192.168.20.142 192.168.20.143              6     18           32
      29 192.168.20.144 192.168.20.145 192.168.20.150 192.168.20.151              6     19           32
      29 192.168.20.152 192.168.20.153 192.168.20.158 192.168.20.159              6     20           32
      29 192.168.20.160 192.168.20.161 192.168.20.166 192.168.20.167              6     21           32
      29 192.168.20.168 192.168.20.169 192.168.20.174 192.168.20.175              6     22           32
      29 192.168.20.176 192.168.20.177 192.168.20.182 192.168.20.183              6     23           32
      29 192.168.20.184 192.168.20.185 192.168.20.190 192.168.20.191              6     24           32
      29 192.168.20.192 192.168.20.193 192.168.20.198 192.168.20.199              6     25           32
      29 192.168.20.200 192.168.20.201 192.168.20.206 192.168.20.207              6     26           32
      29 192.168.20.208 192.168.20.209 192.168.20.214 192.168.20.215              6     27           32
      29 192.168.20.216 192.168.20.217 192.168.20.222 192.168.20.223              6     28           32
      29 192.168.20.224 192.168.20.225 192.168.20.230 192.168.20.231              6     29           32
      29 192.168.20.232 192.168.20.233 192.168.20.238 192.168.20.239              6     30           32
      29 192.168.20.240 192.168.20.241 192.168.20.246 192.168.20.247              6     31           32
      29 192.168.20.248 192.168.20.249 192.168.20.254 192.168.20.255              6     32           32
    

     Mask: 30
  
  Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
  ---- --------       ------------   -----------    -----------    -------------- ------ ------------
    30 192.168.20.0   192.168.20.1   192.168.20.2   192.168.20.3                2      1           64
    30 192.168.20.4   192.168.20.5   192.168.20.6   192.168.20.7                2      2           64
    30 192.168.20.8   192.168.20.9   192.168.20.10  192.168.20.11               2      3           64
    30 192.168.20.12  192.168.20.13  192.168.20.14  192.168.20.15               2      4           64
    30 192.168.20.16  192.168.20.17  192.168.20.18  192.168.20.19               2      5           64
    30 192.168.20.20  192.168.20.21  192.168.20.22  192.168.20.23               2      6           64
    30 192.168.20.24  192.168.20.25  192.168.20.26  192.168.20.27               2      7           64
    30 192.168.20.28  192.168.20.29  192.168.20.30  192.168.20.31               2      8           64
    30 192.168.20.32  192.168.20.33  192.168.20.34  192.168.20.35               2      9           64
    30 192.168.20.36  192.168.20.37  192.168.20.38  192.168.20.39               2     10           64
    30 192.168.20.40  192.168.20.41  192.168.20.42  192.168.20.43               2     11           64
    30 192.168.20.44  192.168.20.45  192.168.20.46  192.168.20.47               2     12           64
    30 192.168.20.48  192.168.20.49  192.168.20.50  192.168.20.51               2     13           64
    30 192.168.20.52  192.168.20.53  192.168.20.54  192.168.20.55               2     14           64
    30 192.168.20.56  192.168.20.57  192.168.20.58  192.168.20.59               2     15           64
    30 192.168.20.60  192.168.20.61  192.168.20.62  192.168.20.63               2     16           64
    30 192.168.20.64  192.168.20.65  192.168.20.66  192.168.20.67               2     17           64
    30 192.168.20.68  192.168.20.69  192.168.20.70  192.168.20.71               2     18           64
    30 192.168.20.72  192.168.20.73  192.168.20.74  192.168.20.75               2     19           64
    30 192.168.20.76  192.168.20.77  192.168.20.78  192.168.20.79               2     20           64
    30 192.168.20.80  192.168.20.81  192.168.20.82  192.168.20.83               2     21           64
    30 192.168.20.84  192.168.20.85  192.168.20.86  192.168.20.87               2     22           64
    30 192.168.20.88  192.168.20.89  192.168.20.90  192.168.20.91               2     23           64
    30 192.168.20.92  192.168.20.93  192.168.20.94  192.168.20.95               2     24           64
    30 192.168.20.96  192.168.20.97  192.168.20.98  192.168.20.99               2     25           64
    30 192.168.20.100 192.168.20.101 192.168.20.102 192.168.20.103              2     26           64
    30 192.168.20.104 192.168.20.105 192.168.20.106 192.168.20.107              2     27           64
    30 192.168.20.108 192.168.20.109 192.168.20.110 192.168.20.111              2     28           64
    30 192.168.20.112 192.168.20.113 192.168.20.114 192.168.20.115              2     29           64
    30 192.168.20.116 192.168.20.117 192.168.20.118 192.168.20.119              2     30           64
    30 192.168.20.120 192.168.20.121 192.168.20.122 192.168.20.123              2     31           64
    30 192.168.20.124 192.168.20.125 192.168.20.126 192.168.20.127              2     32           64
    30 192.168.20.128 192.168.20.129 192.168.20.130 192.168.20.131              2     33           64
    30 192.168.20.132 192.168.20.133 192.168.20.134 192.168.20.135              2     34           64
    30 192.168.20.136 192.168.20.137 192.168.20.138 192.168.20.139              2     35           64
    30 192.168.20.140 192.168.20.141 192.168.20.142 192.168.20.143              2     36           64
    30 192.168.20.144 192.168.20.145 192.168.20.146 192.168.20.147              2     37           64
    30 192.168.20.148 192.168.20.149 192.168.20.150 192.168.20.151              2     38           64
    30 192.168.20.152 192.168.20.153 192.168.20.154 192.168.20.155              2     39           64
    30 192.168.20.156 192.168.20.157 192.168.20.158 192.168.20.159              2     40           64
    30 192.168.20.160 192.168.20.161 192.168.20.162 192.168.20.163              2     41           64
    30 192.168.20.164 192.168.20.165 192.168.20.166 192.168.20.167              2     42           64
    30 192.168.20.168 192.168.20.169 192.168.20.170 192.168.20.171              2     43           64
    30 192.168.20.172 192.168.20.173 192.168.20.174 192.168.20.175              2     44           64
    30 192.168.20.176 192.168.20.177 192.168.20.178 192.168.20.179              2     45           64
    30 192.168.20.180 192.168.20.181 192.168.20.182 192.168.20.183              2     46           64
    30 192.168.20.184 192.168.20.185 192.168.20.186 192.168.20.187              2     47           64
    30 192.168.20.188 192.168.20.189 192.168.20.190 192.168.20.191              2     48           64
    30 192.168.20.192 192.168.20.193 192.168.20.194 192.168.20.195              2     49           64
    30 192.168.20.196 192.168.20.197 192.168.20.198 192.168.20.199              2     50           64
    30 192.168.20.200 192.168.20.201 192.168.20.202 192.168.20.203              2     51           64
    30 192.168.20.204 192.168.20.205 192.168.20.206 192.168.20.207              2     52           64
    30 192.168.20.208 192.168.20.209 192.168.20.210 192.168.20.211              2     53           64
    30 192.168.20.212 192.168.20.213 192.168.20.214 192.168.20.215              2     54           64
    30 192.168.20.216 192.168.20.217 192.168.20.218 192.168.20.219              2     55           64
    30 192.168.20.220 192.168.20.221 192.168.20.222 192.168.20.223              2     56           64
    30 192.168.20.224 192.168.20.225 192.168.20.226 192.168.20.227              2     57           64
    30 192.168.20.228 192.168.20.229 192.168.20.230 192.168.20.231              2     58           64
    30 192.168.20.232 192.168.20.233 192.168.20.234 192.168.20.235              2     59           64
    30 192.168.20.236 192.168.20.237 192.168.20.238 192.168.20.239              2     60           64
    30 192.168.20.240 192.168.20.241 192.168.20.242 192.168.20.243              2     61           64
    30 192.168.20.244 192.168.20.245 192.168.20.246 192.168.20.247              2     62           64
    30 192.168.20.248 192.168.20.249 192.168.20.250 192.168.20.251              2     63           64
    30 192.168.20.252 192.168.20.253 192.168.20.254 192.168.20.255              2     64           64
    
  .Example 
    Find-ValidSubnet -AzureSubnet -CIDRSubnetAddress 200.107.30.0/24 -HostsPerSubnetRequired 12 -SubnetsRequired 4 | ft -GroupBy mask
    This will calculate the required subnet ranges taking into account that Azure reserves 5 addresses by convention 
    instead of the 2 for a standard subnet:
    for a /24 subnet Azure reserves the folloing:
    x.x.x.x.0 Subnet ID
    x.x.x.x.1 Default gateway
    x.x.x.x.2 & x.x.x.x.3 DNS 
    x.x.x.x.255 Broadcast
    
       Mask: 26
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      26 200.107.30.0   200.107.30.4   200.107.30.62  200.107.30.63              59      1            4
      26 200.107.30.64  200.107.30.68  200.107.30.126 200.107.30.127             59      2            4
      26 200.107.30.128 200.107.30.132 200.107.30.190 200.107.30.191             59      3            4
      26 200.107.30.192 200.107.30.196 200.107.30.254 200.107.30.255             59      4            4
    
    
       Mask: 27
    
    Mask SubnetID       FirstValidIP   LastValidIP    BroadcastIP    HostsPerSubnet Subnet TotalSubnets
    ---- --------       ------------   -----------    -----------    -------------- ------ ------------
      27 200.107.30.0   200.107.30.4   200.107.30.30  200.107.30.31              27      1            8
      27 200.107.30.32  200.107.30.36  200.107.30.62  200.107.30.63              27      2            8
      27 200.107.30.64  200.107.30.68  200.107.30.94  200.107.30.95              27      3            8
      27 200.107.30.96  200.107.30.100 200.107.30.126 200.107.30.127             27      4            8
      27 200.107.30.128 200.107.30.132 200.107.30.158 200.107.30.159             27      5            8
      27 200.107.30.160 200.107.30.164 200.107.30.190 200.107.30.191             27      6            8
      27 200.107.30.192 200.107.30.196 200.107.30.222 200.107.30.223             27      7            8
      27 200.107.30.224 200.107.30.228 200.107.30.254 200.107.30.255             27      8            8
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
  .PARAMETER AzureSubnet
    This parameter changes the ranges of each subnet removing 5 host IDs as Azure uses 
    x.x.x.1 for Default Gateway, x.x.x.2 & x.x.x.3 for DNS mapping.
  .NOTES
    General notes
      Created by:    Brent Denny
      Created on:    09 Mar 2021
      Last Modified: 30 Jun 2021
  #>
  [cmdletbinding(DefaultParameterSetName='Default',PositionalBinding=$false)]
  Param (
    [Parameter(ParameterSetName='VLSM')]
    [Parameter(ParameterSetName='Subnet')]
    [switch]$AzureSubnet,
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
      [int]$SubnetMask,
      [switch]$Azure
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
    if ($Azure -eq $true) {$AzureReserved = 3}
    else {$AzureReserved = 0}
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
      $FirstValidRevDec = $ThisSubnetRevDec + 1 + $AzureReserved
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
        HostsPerSubnet = [math]::Pow(2,32 -$SubnetMask) - (2 + $AzureReserved)
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
  if ($AzureSubnet -eq $true) {$Reserved = 5} # Azure reserves 5 hostids for internal and netork reasons
  else {$Reserved = 2} # This is the subnetID and BroadcastID
  $HostBitsRequired = [math]::Ceiling([math]::Log($HostsPerSubnetRequired+$Reserved)/[math]::log(2))  # +2 to cater for NetworkId and BroadcastID addresses
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
      if ($AzureSubnet -eq $true) {
        Find-IPSubnetRange -IPAddress $ActualNetworkAddrSet.FwdAddrIP -InitialMask $InitialMask -SubnetMask $SubnettedBits -Azure | 
        Where-Object {$_.HostsPerSubnet -ge $HostsPerSubnetRequired -and $_.TotalSubnets -ge $SubnetsRequired}
      }
      else {
        Find-IPSubnetRange -IPAddress $ActualNetworkAddrSet.FwdAddrIP -InitialMask $InitialMask -SubnetMask $SubnettedBits | 
        Where-Object {$_.HostsPerSubnet -ge $HostsPerSubnetRequired -and $_.TotalSubnets -ge $SubnetsRequired}
      }
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