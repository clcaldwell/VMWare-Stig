$VID = "V-63273"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Web Client select the ESXi Host and go to Manage >> Networking >> TCP/IP configuration.  Review the default system TCP/IP stacks and verify they are configured with the appropriate IP address information.

If any system TCP/IP stack is configured and not in use by a VMkernel adapter, this is a finding.

