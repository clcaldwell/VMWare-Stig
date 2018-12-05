$VID = "V-63191"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify which SSH protocol version is configured, run the following command: 

# grep -i "^Protocol" /etc/ssh/sshd_config

If there is no output or the output is not exactly "Protocol 2", this is a finding.

