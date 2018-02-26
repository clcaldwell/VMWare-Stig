$VID = "V-64085"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.unity.windowContents.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.unity.windowContents.disable: '$Value'. Must be '$True'"
    }
}
