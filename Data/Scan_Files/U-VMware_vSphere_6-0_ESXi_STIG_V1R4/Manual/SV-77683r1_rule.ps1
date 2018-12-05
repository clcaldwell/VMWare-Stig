$VID = "V-63193"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify how the SSH daemon's "IgnoreRhosts" option is set, run the following command: 

# grep -i "^IgnoreRhosts" /etc/ssh/sshd_config

If there is no output or the output is not exactly "IgnoreRhosts yes", this is a finding.

