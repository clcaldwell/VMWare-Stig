$VID = "V-64061"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.ghi.launchmenu.change ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.ghi.launchmenu.change: '$Value'. Must be '$True'"
    }
}
