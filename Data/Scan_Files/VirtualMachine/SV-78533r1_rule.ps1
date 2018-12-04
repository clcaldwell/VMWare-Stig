$VID = "V-64043"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.setGUIOptions.enable ).Value

Switch ( $Value -eq $False ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.setGUIOptions.enable: '$Value'. Must be '$False'"
    }
}
