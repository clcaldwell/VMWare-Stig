$VID = "V-63267"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

The Management VMkernel port group should in a dedicated VLAN that can be on a common standard or distributed virtual switch as long as the Management VLAN is not shared by any other function and it not routed to anything other than management related functions such as vCenter.  The check for this will be unique per environment.  From the vSphere Client select the ESXi host and go to Configuration >> Networking and review the VLAN associated with the Management VMkernel and verify they are dedicated for that purpose and are logically separated from other functions.

If the network segment is routed, except to networks where other management-related entities are located such as vCenter, this is a finding.

If production virtual machine traffic is routed to this network, this is a finding.

