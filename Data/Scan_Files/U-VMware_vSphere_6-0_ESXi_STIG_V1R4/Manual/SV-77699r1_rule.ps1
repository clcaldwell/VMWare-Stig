$VID = "V-63209"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the StrictModes setting, run the following command: 

# grep -i "^StrictModes" /etc/ssh/sshd_config

If there is no output or the output is not exactly "StrictModes yes", this is a finding.

