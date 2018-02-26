$VID = "V-64107"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.autoInstall.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.autoInstall.disable: '$Value'. Must be '$True'"
    }
}
