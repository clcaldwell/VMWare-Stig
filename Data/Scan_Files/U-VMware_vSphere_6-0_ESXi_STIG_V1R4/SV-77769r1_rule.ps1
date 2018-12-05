$VID = "V-63279"

$Value = ( $VMHost | Get-AdvancedSetting -Name Mem.ShareForceSalting ).Value

Switch ( $Value -eq "2" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Mem.ShareForceSalting: '$Value'. Must be '2'"
    }
}
