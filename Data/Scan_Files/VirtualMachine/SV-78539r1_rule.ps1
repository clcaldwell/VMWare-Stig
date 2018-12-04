$VID = "V-64049"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.diskWiper.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.diskWiper.disable: '$Value'. Must be '$True'"
    }
}
