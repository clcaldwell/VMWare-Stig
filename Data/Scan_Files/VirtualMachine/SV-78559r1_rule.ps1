$VID = "V-64069"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.dispTopoRequest.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.dispTopoRequest.disable: '$Value'. Must be '$True'"
    }
}
