$VID = "V-63201"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify users are not able to present environment daemons, run the following command: 

# grep -i "^PermitUserEnvironment" /etc/ssh/sshd_config

If there is no output or the output is not exactly "PermitUserEnvironment no", this is a finding.

