$VID = "V-63277"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client select the ESXi Host and go to Configuration >> Storage Adapters >> Select the iSCSI adapter >> Properties >> CHAP.  View the CHAP configuration and verify CHAP is required for target and host authentication.

or

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHost | Get-VMHostHba | Where {$_.Type -eq "iscsi"} | Select AuthenticationProperties -ExpandProperty AuthenticationProperties

If iSCSI is not used, this is not a finding.

If iSCSI is used and CHAP is not set to required for both the target and host, this is a finding.

If iSCSI is used and unique CHAP secrets are not used for each host, this is a finding.

