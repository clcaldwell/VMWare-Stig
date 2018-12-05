$VID = "V-64109"

$Value = ( $VM | Get-AdvancedSetting -Name tools.setinfo.sizeLimit ).Value

Switch ( $Value -eq "1048576" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "tools.setinfo.sizeLimit: '$Value'. Must be '1048576'"
    }
}
