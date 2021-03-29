$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"

$ip_addresses = @(Get-Content '.\logfile.txt')

$regex.Matches($ip_addresses) | Group-Object | 
ForEach-Object { '{0}    {1}' -f $_.Name , $_.Count } |
    Set-Content '.\output.txt'
