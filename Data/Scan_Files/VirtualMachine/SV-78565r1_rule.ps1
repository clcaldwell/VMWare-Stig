$VID = "V-64075"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.unity.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.unity.disable: '$Value'. Must be '$True'"
    }
}
