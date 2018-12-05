$VID = "V-63897"

$Value = ( $VMHost | Get-AdvancedSetting -Name Config.HostAgent.plugins.hostsvc.esxAdminsGroup ).Value

Switch ( $Value -eq "ESX Admins" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Config.HostAgent.plugins.hostsvc.esxAdminsGroup: '$Value'. Must be 'ESX Admins'"
    }
}
