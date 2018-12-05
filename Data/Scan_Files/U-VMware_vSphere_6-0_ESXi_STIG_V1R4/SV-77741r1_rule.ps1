$VID = "V-63251"

$Value = ( $VMHost | Get-AdvancedSetting -Name UserVars.ESXiShellInteractiveTimeOut ).Value

Switch ( $Value -eq "600" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "UserVars.ESXiShellInteractiveTimeOut: '$Value'. Must be '600'"
    }
}
