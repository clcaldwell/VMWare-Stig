$VID = "V-63299"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client select the ESXi Host and go to Configuration >> Networking.  Review the port group VLAN tags and verify they are not set to a reserved VLAN ID.

or

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VirtualPortGroup | Select Name, VLanId

If any port group is configured with a reserved VLAN ID, this is a finding.

