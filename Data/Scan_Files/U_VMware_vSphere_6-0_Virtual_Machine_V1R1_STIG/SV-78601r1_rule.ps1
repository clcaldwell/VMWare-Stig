$VID = "V-64111"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.device.connectable.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.device.connectable.disable: '$Value'. Must be '$True'"
    }
}
