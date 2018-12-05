$VID = "V-63189"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

Only FIPS-approved ciphers should be used. To verify that only FIPS-approved ciphers are in use, run the following command: 

# grep -i "^Ciphers" /etc/ssh/sshd_config

If there is no output or the output is not exactly "Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,aes192-cbc,aes256-cbc", this is a finding.

