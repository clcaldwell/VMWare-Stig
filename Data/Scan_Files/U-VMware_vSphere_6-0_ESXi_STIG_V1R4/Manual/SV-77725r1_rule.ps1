$VID = "V-63235"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify the password hash setting, run the following command: 

# grep -i "^password" /etc/pam.d/passwd | grep sufficient

If sha512 is not listed, this is a finding.

