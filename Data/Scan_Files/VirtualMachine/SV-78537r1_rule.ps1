$VID = "V-64047"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.diskShrink.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.diskShrink.disable: '$Value'. Must be '$True'"
    }
}
