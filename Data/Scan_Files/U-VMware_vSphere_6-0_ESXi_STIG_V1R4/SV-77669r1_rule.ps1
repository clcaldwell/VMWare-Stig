$VID = "V-63179"

$Value = ( $VMHost | Get-AdvancedSetting -Name Security.AccountLockFailures ).Value

Switch ( $Value -eq "3" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Security.AccountLockFailures: '$Value'. Must be '3'"
    }
}
