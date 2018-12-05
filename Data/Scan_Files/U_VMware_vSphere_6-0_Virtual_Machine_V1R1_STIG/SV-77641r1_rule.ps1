$VID = "V-63151"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.copy.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.copy.disable: '$Value'. Must be '$True'"
    }
}
