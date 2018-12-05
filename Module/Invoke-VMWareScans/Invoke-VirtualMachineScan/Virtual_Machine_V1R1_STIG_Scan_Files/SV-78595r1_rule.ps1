$VID = "V-64105"

$Value = ( $VM | Get-AdvancedSetting -Name RemoteDisplay.vnc.enabled ).Value

Switch ( $Value -eq $False ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "RemoteDisplay.vnc.enabled: '$Value'. Must be '$False'"
    }
}
