$VID = "V-63531"

$Value = ( $VMHost | Get-AdvancedSetting -Name Security.PasswordQualityControl ).Value

Switch ( $Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15 similar" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15 similar'"
    }
}
