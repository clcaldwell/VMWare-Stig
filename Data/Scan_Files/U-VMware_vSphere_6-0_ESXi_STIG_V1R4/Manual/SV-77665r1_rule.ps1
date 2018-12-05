$VID = "V-63175"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Web Client select the ESXi Host and go to Manage >> Settings >> Security Profile.  Under lockdown mode review the exception users list.

or

From a PowerCLI command prompt while connected to the ESXi host run the following script:

$vmhost = Get-VMHost | Get-View
$lockdown = Get-View $vmhost.ConfigManager.HostAccessManager
$lockdown.QueryLockdownExceptions()

If the exception users list contains accounts that do not require special permissions, this is a finding.

Note: This list is not intended for system administrator accounts but for special circumstances such as a service account.

