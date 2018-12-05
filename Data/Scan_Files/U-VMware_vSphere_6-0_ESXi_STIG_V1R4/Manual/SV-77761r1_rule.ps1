$VID = "V-63271"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Web Client select the ESXi Host and go to Manage >> Networking >> VMkernel adapters.  Review each VMkernel adapter that is defined and ensure it is enabled for only one type of management traffic.

If any VMkernel is used for more than one type of management traffic, this is a finding.

