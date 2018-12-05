$VID = "V-63195"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify how the SSH daemon's "HostbasedAuthentication" option is set, run the following command: 

# grep -i "^HostbasedAuthentication" /etc/ssh/sshd_config

If there is no output or the output is not exactly "HostbasedAuthentication no", this is a finding.

