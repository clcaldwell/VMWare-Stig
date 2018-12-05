$VID = "V-63913"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Web Client select the ESXi Host and go to Manage >> Authentication Services and view the Smart Card Authentication status.

If "Enable Smart Card Authentication" is checked, the system requires smart cards to authentication to an Active Directory Domain.

For systems that have no local user accounts, other than root and/or vpxuser, this is not applicable.

For environments that do not use vCenter server to manage ESXi, this is not applicable.

For systems that do not use smart cards with Active Directory and do have local user accounts, other than root and/or vpxuser, this is a finding.

