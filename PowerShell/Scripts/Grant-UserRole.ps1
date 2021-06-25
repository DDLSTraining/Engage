<#
.SYNOPSIS
   Asigns a role to a user via AD groups.

.DESCRIPTION
    Script status: Under development

.PARAMETER AssumeUserName
   The user who is assuming the role.

.PARAMETER RoleOwnerName
    The user who owns the role to be assumed.

.EXAMPLE
   Grant-UserRole -AssumeUserName 'Joe Blogs' -RoleOwnerName 'Mr Big'
#>
Param (
    [Parameter(Mandatory=$true)]
    [string]
    $AssumeUserName,

    [Parameter(Mandatory=$true)]
    [string]
    $RoleOwnerName
)


# get an assuming AD user
# get role AD user
# Abbi Skinner - Assuming User
# Adam Hobs - Role User

$Assumer = Get-ADUser -Filter "Name -eq '$AssumeUserName'"
$RoleOwner = Get-ADUser -Filter "Name -eq '$RoleOwnerName'"
# TODO - Test users exist and succeeds

# get assuming AD users groups
# get role AD users groups
$AssumerGroups = Get-ADPrincipalGroupMembership -Identity $Assumer
$RoleOwnerGroups = Get-ADPrincipalGroupMembership -Identity $RoleOwner

# save the assuming users groups
# save the role users groups

$guid = New-Guid | Select-Object -ExpandProperty Guid

$ADObjects = [PSCustomObject]@{
    Guid=$guid;
    Assumer=$Assumer.DistinguishedName;
    RoleOwner=$RoleOwner.DistinguishedName;
    AssumerGroups=$AssumerGroups;
    RoleOwnerGroups=$RoleOwnerGroups;
}

$saveFileName = "$AssumeUserName-$RoleOwnerName-$guid.xml".Replace(' ','-')
Export-Clixml -Path $saveFileName -InputObject $ADObjects

# Add-ADGroupMember 


# remove assuming users group memberships

# assign role users group membership to the assuming user