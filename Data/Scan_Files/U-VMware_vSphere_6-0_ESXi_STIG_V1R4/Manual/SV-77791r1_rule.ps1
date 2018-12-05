$VID = "V-63301"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

Note: This check refers to an entity outside the physical scope of the ESXi server system. The configuration of external switch ports as trunk ports must be documented. Virtual Switch Tagging (VST) mode does not support Dynamic Trunking Protocol (DTP), so the trunk must be static and unconditional. Inspect the documentation and verify that the documentation is correct and updated on a regular basis and/or whenever modifications are made to either ESXi hosts or the upstream external switch ports.

If DTP is enabled on the physical switch ports connected to the ESXi Host, this is a finding.

