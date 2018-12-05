$VID = "V-63293"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Client select the ESXi Host and go to Configuration >> Advanced Settings.  Select the Net.DVFilterBindIpAddress value and verify the value is blank or the correct IP address of a security appliance if in use.

or

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHost | Get-AdvancedSetting -Name Net.DVFilterBindIpAddress

If the Net.DVFilterBindIpAddress is not blank and security appliances are not in use on the host, this is a finding.

