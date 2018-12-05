$VID = "V-63275"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHostSnmp | Select *

or

From a console or ssh session run the follow command:

esxcli system snmp get

If SNMP is not in use and is enabled, this is a finding.

If SNMP is enabled and "read only communities" is set to public, this is a finding.

If SNMP is enabled and is not using v3 targets, this is a finding.

Note: SNMP v3 targets can only be viewed and configured from the esxcli command.

