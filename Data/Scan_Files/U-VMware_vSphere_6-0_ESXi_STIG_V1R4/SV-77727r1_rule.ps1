$VID = "V-63237"

$Value = ( $VMHost | Get-AdvancedSetting -Name Config.HostAgent.plugins.solo.enableMob ).Value

Switch ( $Value -eq "false" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Config.HostAgent.plugins.solo.enableMob: '$Value'. Must be 'false'"
    }
}
