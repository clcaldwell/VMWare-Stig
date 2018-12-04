$VID = "V-64053"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.hgfsServerSet.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.hgfsServerSet.disable: '$Value'. Must be '$True'"
    }
}
