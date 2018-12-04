$VID = "V-64041"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.dnd.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.dnd.disable: '$Value'. Must be '$True'"
    }
}
