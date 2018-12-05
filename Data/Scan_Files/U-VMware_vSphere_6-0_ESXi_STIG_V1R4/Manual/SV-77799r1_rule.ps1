$VID = "V-63309"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

If the CIM account does not exist, this check is not applicable.

If write access is required, this check is not applicable.

From the vSphere client, select the ESXi host, and go to "Permissions". Select the CIM account user, then right-click and select properties to verify read-only access.

If write access is not required and the access level is not "read-only", this is a finding.

