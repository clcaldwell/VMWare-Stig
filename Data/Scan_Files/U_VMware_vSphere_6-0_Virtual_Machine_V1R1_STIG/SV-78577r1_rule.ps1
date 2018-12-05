$VID = "V-64087"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.vmxDnDVersionGet.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.vmxDnDVersionGet.disable: '$Value'. Must be '$True'"
    }
}
