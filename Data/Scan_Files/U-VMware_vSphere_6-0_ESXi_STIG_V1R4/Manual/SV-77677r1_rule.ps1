$VID = "V-63187"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the Banner setting, run the following command: 

# grep -i "^Banner" /etc/ssh/sshd_config

If there is no output or the output is not exactly "Banner /etc/issue", this is a finding.

