$VID = "V-64065"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.ghi.protocolhandler.info.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.ghi.protocolhandler.info.disable: '$Value'. Must be '$True'"
    }
}
