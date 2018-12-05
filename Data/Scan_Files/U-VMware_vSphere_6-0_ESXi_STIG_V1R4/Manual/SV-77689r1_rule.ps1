$VID = "V-63199"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

To verify how the SSH daemon's "PermitEmptyPasswords" option is set, run the following command: 

# grep -i "^PermitEmptyPasswords" /etc/ssh/sshd_config

If there is no output or the output is not exactly "PermitEmptyPasswords no", this is a finding.

