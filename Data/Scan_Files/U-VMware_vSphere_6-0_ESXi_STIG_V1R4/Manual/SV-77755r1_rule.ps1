$VID = "V-63265"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

The vMotion VMkernel port group should in a dedicated VLAN that can be on a common standard or distributed virtual switch as long as the vMotion VLAN is not shared by any other function and it not routed to anything but ESXi hosts.  The check for this will be unique per environment.  From the vSphere Client select the ESXi host and go to Configuration >> Networking and review the VLAN associated with the vMotion VMkernel(s) and verify they are dedicated for that purpose and are logically separated from other functions.

If long distance or cross vCenter vMotion is used the vMotion network can be routable but must be accessible to only the intended ESXi hosts.

If the vMotion port group is not on an isolated VLAN and/or is routable to systems other than ESXi hosts, this is a finding.

For environments that do not use vCenter server to manage ESXi, this is not applicable.

