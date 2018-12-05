$VID = "V-63509"

$Value = ( $VMHost | Get-AdvancedSetting -Name Config.HostAgent.log.level ).Value

Switch ( $Value -eq "info" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Config.HostAgent.log.level: '$Value'. Must be 'info'"
    }
}
