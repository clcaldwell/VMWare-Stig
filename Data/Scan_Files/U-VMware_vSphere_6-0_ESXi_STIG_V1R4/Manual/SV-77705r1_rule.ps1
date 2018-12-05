$VID = "V-63215"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the X11Forwarding setting, run the following command: 

# grep -i "^X11Forwarding" /etc/ssh/sshd_config

If there is no output or the output is not exactly "X11Forwarding no", this is a finding.

