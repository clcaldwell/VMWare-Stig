$VID = "V-64059"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.getCreds.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.getCreds.disable: '$Value'. Must be '$True'"
    }
}
