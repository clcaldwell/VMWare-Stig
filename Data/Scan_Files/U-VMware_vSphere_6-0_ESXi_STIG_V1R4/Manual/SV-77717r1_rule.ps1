$VID = "V-63227"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

Log in to the host and verify the /etc/ssh/keys-root/authorized_keys file does not exist or is empty (zero bytes): 
# ls -la /etc/ssh/keys-root/authorized_keys

or

#cat /etc/ssh/keys-root/authorized_keys

If the authorized_keys file exists and is not empty, this is a finding.

