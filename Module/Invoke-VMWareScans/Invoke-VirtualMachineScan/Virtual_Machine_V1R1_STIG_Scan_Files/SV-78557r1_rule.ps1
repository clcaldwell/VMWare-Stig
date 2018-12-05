$VID = "V-64067"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.ghi.host.shellAction.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.ghi.host.shellAction: '$Value'. Must be '$True'"
    }
}
