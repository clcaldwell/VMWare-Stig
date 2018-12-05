$VID = "V-63181"

$Value = ( $VMHost | Get-AdvancedSetting -Name Security.AccountUnlockTime ).Value

Switch ( $Value -eq "900" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Security.AccountUnlockTime: '$Value'. Must be '900'"
    }
}
