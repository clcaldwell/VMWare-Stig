$VID = "V-63775"

$Value = ( $VMHost | Get-AdvancedSetting -Name UserVars.ESXiShellTimeOut ).Value

Switch ( $Value -eq "600" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "UserVars.ESXiShellTimeOut: '$Value'. Must be '600'"
    }
}
