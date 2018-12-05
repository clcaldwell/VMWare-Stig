$VID = "V-63257"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Web Client select the ESXi Host and right click.  If the "Add Diagnostic Partition" option is greyed out then core dumps are configured.

or

From a PowerCLI command prompt while connected to the ESXi host run the following commands:

$esxcli = Get-EsxCli
$esxcli.system.coredump.partition.get()
$esxcli.system.coredump.network.get()

The first command prepares for the other two. The second command shows whether there is an active core dump partition configured. The third command shows whether a network core dump collector is configured and enabled, via the "HostVNic", "NetworkServerIP", "NetworkServerPort", and "Enabled" variables. 

If there is no active core dump partition or the network core dump collector is not configured and enabled, this is a finding.

