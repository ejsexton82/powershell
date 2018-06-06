Param(
	[string]$username,
	[string]$password,
	[string]$domain,
	[string]$subdomain
);

<##
 # Uses GoogleDynamicDNSTools by Port1433.com.
 #
 # Install-Module GoogleDynamicDNSTools
 #>
Import-Module GoogleDynamicDNSTools

$SecurePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
 
$Credential = New-Object System.Management.Automation.PSCredential $username , $SecurePassword
 
Update-GoogleDynamicDNS -credential $Credential -domainName $domain -subdomainName $subdomain -Verbose
