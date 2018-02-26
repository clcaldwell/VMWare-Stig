$VID = "V-64115"

$Value = ( $VM | Get-AdvancedSetting -Name tools.guestlib.enableHostInfo ).Value

Switch ( $Value -eq $False ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "tools.guestlib: '$Value'. Must be '$False'"
    }
}
