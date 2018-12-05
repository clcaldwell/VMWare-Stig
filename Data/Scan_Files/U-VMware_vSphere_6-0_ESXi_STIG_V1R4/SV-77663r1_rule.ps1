$VID = "V-63173"

$Value = ( $VMHost | Get-AdvancedSetting -Name DCUI.Access ).Value

Switch ( $Value -eq "root" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "DCUI.Access: '$Value'. Must be 'root'"
    }
}
