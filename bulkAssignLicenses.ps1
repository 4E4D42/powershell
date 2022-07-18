Import-Module MSOnline
Connect-MsolService

$users = Import-Csv "C:\Users\nathan.bartholomew\Downloads\users.csv" -Delimiter ","
foreach ($user in $users)
{
    $upn = $user.UserPrincipalName
    # $usagelocation = $user.usagelocation
    $SKU = $user.SKU

    # Set-MsolUser -UserPrincipalName $upn -UsageLocation $usagelocation
    Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $SKU

    $toShell = "License has been assigned to {0}" -f $upn
    Write-Output $toShell
}






