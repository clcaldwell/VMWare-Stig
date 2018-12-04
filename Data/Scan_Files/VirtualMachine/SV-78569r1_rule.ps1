$VID = "V-64079"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.unity.push.update.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.unity.push.update.disable: '$Value'. Must be '$True'"
    }
}
