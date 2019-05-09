[System.Array[]]$IP= @()
$Targets = get-content ip.txt
#$Targets = "p164742.vlaanderen.be"
Add-Content resolution.csv  -Value 'Hostname;IP'
ForEach($Name in $Targets)
	{
	$IP = Resolve-DnsName $Name A 
		if( $IP.ipAddress -ne $null )
		{
			foreach($value in $IP.ipaddress)
			{

			Add-Content resolution.csv  -Value "$Name;$value"

			}
		}
		else #There was nothing to resolve to.
		{
		Add-Content resolution.csv  -Value "$Name;NO IP"
		}

	}
