$VID = "V-63219"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the PermitTunnel setting, run the following command: 

# grep -i "^PermitTunnel" /etc/ssh/sshd_config

If there is no output or the output is not exactly "PermitTunnel no", this is a finding.

