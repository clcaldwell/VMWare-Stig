$VID = "V-64113"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.device.edit.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.device.edit.disable: '$Value'. Must be '$True'"
    }
}
