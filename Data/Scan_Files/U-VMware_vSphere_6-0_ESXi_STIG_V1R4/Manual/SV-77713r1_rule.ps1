$VID = "V-63223"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the ClientAliveInterval setting, run the following command: 

# grep -i "^ClientAliveInterval" /etc/ssh/sshd_config

If there is no output or the output is not exactly "ClientAliveInterval 200", this is a finding.

