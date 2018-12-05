$VID = "V-63915"

$Value = ( $VMHost | Get-AdvancedSetting -Name Syslog.global.logHost ).Value

Switch ( $Value -eq "tcp://sphsvr304.phnsy.sy:1514" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Syslog.global.logHost: '$Value'. Must be 'tcp://sphsvr304.phnsy.sy:1514'"
    }
}
