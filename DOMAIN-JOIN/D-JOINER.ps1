$domain = "example.local"
$domainUsername = "domain\username"
$domainPassword = "P@ssw0rd!" | ConvertTo-SecureString -AsPlainText -Force
$domainCredential = New-Object System.Management.Automation.PSCredential($domainUsername, $domainPassword)

Add-Computer -DomainName $domain -Credential $domainCredential -Force -ErrorAction Stop
