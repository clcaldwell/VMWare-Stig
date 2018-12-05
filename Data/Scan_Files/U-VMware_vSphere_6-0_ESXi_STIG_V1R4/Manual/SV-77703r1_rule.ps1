$VID = "V-63213"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the GatewayPorts setting, run the following command: 

# grep -i "^GatewayPorts" /etc/ssh/sshd_config

If there is no output or the output is not exactly "GatewayPorts no", this is a finding.

