$VID = "V-63777"

$Value = ( $VMHost | Get-AdvancedSetting -Name UserVars.DcuiTimeOut ).Value

Switch ( $Value -eq "600" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "UserVars.DcuiTimeOut: '$Value'. Must be '600'"
    }
}
