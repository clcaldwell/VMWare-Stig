$VID = "V-63197"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify how the SSH daemon's "PermitRootLogin" option is set, run the following command: 

# grep -i "^PermitRootLogin" /etc/ssh/sshd_config

If there is no output or the output is not exactly "PermitRootLogin no", this is a finding.

