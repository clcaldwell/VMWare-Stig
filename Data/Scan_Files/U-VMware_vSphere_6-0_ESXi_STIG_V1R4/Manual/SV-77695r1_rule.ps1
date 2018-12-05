$VID = "V-63205"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the GSSAPIAuthentication setting, run the following command: 

# grep -i "^GSSAPIAuthentication" /etc/ssh/sshd_config

If there is no output or the output is not exactly "GSSAPIAuthentication no", this is a finding.

