$VID = "V-64119"

$Value = ( $VM | Get-AdvancedSetting -Name "ethernet*.filter*.name*" )

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "ethernet*.filter*.name: '$Value'. Must be '$Null'"
    }
}

