$VID = "V-63909"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client go to Home >> Host Profiles >> and select a Host Profile to edit.  View the settings under Authentication Configuration >> Active Directory Configuration >> JoinDomain Method.  Verify the method used to join hosts to a domain is set to "Use vSphere Authentication Proxy to add the host to domain".

or

From a PowerCLI command prompt while connected to vCenter run the following command:

Get-VMHost | Select Name, ` @{N="HostProfile";E={$_ | Get-VMHostProfile}}, ` @{N="JoinADEnabled";E={($_ | Get-VmHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory.Enabled}}, ` @{N="JoinDomainMethod";E={(($_ | Get-VMHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory | Select -ExpandProperty Policy | Where {$_.Id -eq "JoinDomainMethodPolicy"}).Policyoption.Id}}

Verify if JoinADEnabled is True then JoinDomainMethod should be "FixedCAMConfigOption".

For systems that do not use Active Directory and have no local user accounts, other than root and/or vpxuser, this is not applicable.

For systems that do not use Active Directory and do have local user accounts, other than root and/or vpxuser, this is a finding.

If vSphere Authentication Proxy is not used to join hosts to an Active Directory domain, this is a finding.

