$VID = "V-64091"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.vixMessage.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.vixMessage.disable: '$Value'. Must be '$True'"
    }
}
