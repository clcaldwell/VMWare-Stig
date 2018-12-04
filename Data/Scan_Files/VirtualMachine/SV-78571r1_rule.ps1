$VID = "V-64081"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.unity.taskbar.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.unity.taskbar.disabled: '$Value'. Must be '$True'"
    }
}
