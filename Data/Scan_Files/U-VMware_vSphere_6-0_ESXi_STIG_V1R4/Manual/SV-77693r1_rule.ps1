$VID = "V-63203"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the MACs setting, run the following command: 

# grep -i "^MACs" /etc/ssh/sshd_config

If there is no output or the output is not exactly "MACs hmac-sha1,hmac-sha2-256,hmac-sha2-512", this is a finding.

