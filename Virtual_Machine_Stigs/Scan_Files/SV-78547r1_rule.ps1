$VID = "V-64057"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.bios.bbs.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.bios.bbs.disable: '$Value'. Must be '$True'"
    }
}
