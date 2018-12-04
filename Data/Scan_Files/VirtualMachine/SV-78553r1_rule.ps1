$VID = "V-64063"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.memSchedFakeSampleStats.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.memSchedFakeSampleStats.disable: '$Value'. Must be '$True'"
    }
}
