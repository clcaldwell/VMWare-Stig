$VID = "V-63283"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHostFirewallDefaultPolicy

If the Incoming or Outgoing policies are True, this is a finding.

