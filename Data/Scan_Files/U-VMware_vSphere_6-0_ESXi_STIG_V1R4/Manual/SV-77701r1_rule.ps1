$VID = "V-63211"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the Compression setting, run the following command: 

# grep -i "^Compression" /etc/ssh/sshd_config

If there is no output or the output is not exactly "Compression no", this is a finding.

