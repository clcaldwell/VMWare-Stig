$VID = "V-64117"

$Value = ( $VM | Get-AdvancedSetting -Name sched.mem.pshare.salt ).Value

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "sched.mem.pshare.salt: '$Value'. Must be '$Null'"
    }
}
