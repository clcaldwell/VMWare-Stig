$VID = "V-64103"

$Value = ( $VM | Get-AdvancedSetting -Name RemoteDisplay.maxConnections ).Value

Switch ( $Value -eq "1" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "RemoteDisplay.maxConnections: '$Value'. Must be '1'"
    }
}

