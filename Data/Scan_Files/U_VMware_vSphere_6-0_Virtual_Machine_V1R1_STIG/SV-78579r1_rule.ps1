$VID = "V-64089"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.guestDnDVersionSet.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.guestDnDVersionSet.disable: '$Value'. Must be '$True'"
    }
}
