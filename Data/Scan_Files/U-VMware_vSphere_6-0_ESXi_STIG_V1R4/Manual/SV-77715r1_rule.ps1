$VID = "V-63225"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the MaxSessions setting, run the following command: 

# grep -i "^MaxSessions" /etc/ssh/sshd_config

If there is no output or the output is not exactly "MaxSessions 1", this is a finding.

