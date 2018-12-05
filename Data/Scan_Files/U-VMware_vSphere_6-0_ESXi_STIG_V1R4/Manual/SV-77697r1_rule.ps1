$VID = "V-63207"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the KerberosAuthentication setting, run the following command: 

# grep -i "^KerberosAuthentication" /etc/ssh/sshd_config

If there is no output or the output is not exactly "KerberosAuthentication no", this is a finding.

