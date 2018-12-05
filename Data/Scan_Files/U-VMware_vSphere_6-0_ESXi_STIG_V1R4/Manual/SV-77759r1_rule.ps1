$VID = "V-63269"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

IP-Based storage (iSCSI, NFS, VSAN) VMkernel port groups must be in a dedicated VLAN that can be on a common standard or distributed virtual switch that is logically separated from other traffic types.  The check for this will be unique per environment.  From the vSphere Client select the ESXi host and go to Configuration >> Networking and review the VLANs associated with any IP-Based storage VMkernels and verify they are dedicated for that purpose and are logically separated from other functions.

If any IP-Based storage networks are not isolated from other traffic types, this is a finding.

If IP-based storage is not used, this is not applicable.

