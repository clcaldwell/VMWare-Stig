$VID = "V-63291"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client go to Configuration >> Networking >> vSphere Standard Switch.  View the properties on each virtual switch and port group and verify "Promiscuous Mode" is set to reject.

or

From a PowerCLI command prompt while connected to the ESXi host run the following commands:

Get-VirtualSwitch | Get-SecurityPolicy
Get-VirtualPortGroup | Get-SecurityPolicy

If the "Promiscuous Mode" policy is set to accept, this is a finding.

