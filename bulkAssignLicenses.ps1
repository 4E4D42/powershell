Import-Module MSOnline
Connect-MsolService

# Uses bulkUserList.csv template located in this repo 

$users = Import-Csv "~\bulkUserList.csv" -Delimiter ","

foreach ($user in $users)
{
    $upn = $user.UserPrincipalName
    # Uncomment usagelocation if you need to set region location during license assignment
    # $usagelocation = $user.usagelocation
    $SKU = $user.SKU

    # Set-MsolUser -UserPrincipalName $upn -UsageLocation $usagelocation
    Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $SKU

    $toShell = "License has been assigned to {0}" -f $upn
    Write-Output $toShell
}






