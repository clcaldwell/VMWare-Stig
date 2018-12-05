$VID = "V-63233"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the remember setting, run the following command: 

# grep -i "^password" /etc/pam.d/passwd | grep sufficient

If the remember setting is not set or is not "remember=5", this is a finding.

