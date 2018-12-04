$VID = "V-64045"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.paste.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.paste.disable: '$Value'. Must be '$True'"
    }
}
