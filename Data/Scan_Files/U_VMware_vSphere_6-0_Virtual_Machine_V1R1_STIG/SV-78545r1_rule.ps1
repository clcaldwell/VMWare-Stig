$VID = "V-64055"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.ghi.autologon.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.ghi.autologon.disable: '$Value'. Must be '$True'"
    }
}
