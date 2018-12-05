$VID = "V-63217"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the AcceptEnv setting, run the following command: 

# grep -i "^AcceptEnv" /etc/ssh/sshd_config

If there is no output or the output is not exactly "AcceptEnv", this is a finding.

