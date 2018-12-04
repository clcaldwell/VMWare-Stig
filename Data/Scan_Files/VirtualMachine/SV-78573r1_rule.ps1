$VID = "V-64083"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.unityActive.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.unityActive.disable: '$Value'. Must be '$True'"
    }
}
