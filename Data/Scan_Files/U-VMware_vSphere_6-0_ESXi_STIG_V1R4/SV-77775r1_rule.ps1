$VID = "V-63285"

$Value = ( $VMHost | Get-AdvancedSetting -Name Net.BlockGuestBPDU ).Value

Switch ( $Value -eq "1" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Net.BlockGuestBPDU: '$Value'. Must be '1'"
    }
}
