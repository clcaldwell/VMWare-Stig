$VID = "V-63243"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client select the ESXi Host and go to Configuration >> Authentication Services.  Verify the Directory Services Type is set to Active Directory.

or

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHost | Get-VMHostAuthentication

For systems that do not use Active Directory and have no local user accounts, other than root and/or vpxuser, this is not applicable.

For systems that do not use Active Directory and do have local user accounts, other than root and/or vpxuser, this is a finding.

If the Directory Services Type is not set to "Active Directory", this is a finding.

