$VID = "V-64077"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.unityInterlockOperation.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.unityInterlockOperation.disable: '$Value'. Must be '$True'"
    }
}
