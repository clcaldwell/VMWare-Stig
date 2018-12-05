$VID = "V-63281"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client select the ESXi Host and go to Configuration >> Security Profile.  Under the Firewall section select properties and for each enabled service click Firewall and review the allowed IPs. 

or

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHost | Get-VMHostFirewallException | Where {$_.Enabled -eq $true} | Select Name,Enabled,@{N="AllIPEnabled";E={$_.ExtensionData.AllowedHosts.AllIP}}

If for an enabled service "Allow connections from any IP address" is selected, this is a finding.

