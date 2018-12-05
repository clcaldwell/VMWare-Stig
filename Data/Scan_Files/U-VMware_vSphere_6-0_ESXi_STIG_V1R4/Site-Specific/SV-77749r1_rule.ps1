$VID = "V-63259"

$Value = ( $VMHost | Get-AdvancedSetting -Name Syslog.global.logDir ).Value

Switch ( $Value -eq "[phs_security_audit_logs] vmware" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Syslog.global.logDir: '$Value'. Must be '[phs_security_audit_logs] vmware'"
    }
}
