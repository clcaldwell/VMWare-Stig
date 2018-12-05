$VID = "V-63221"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the ClientAliveCountMax setting, run the following command: 

# grep -i "^ClientAliveCountMax" /etc/ssh/sshd_config

If there is no output or the output is not exactly "ClientAliveCountMax 3", this is a finding.

