$VID = "V-73131"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

If no clusters are enabled for VSAN, this is not applicable.

From the vSphere Web Client go to Host and Clusters >> Select a Cluster >> Manage >> Settings >> Virtual SAN >> Health. Review the "Health Service Status" and verify that it is set to "Enabled".

If VSAN is enabled and there is no VSAN health check installed or the VSAN health check is disabled, this is a finding.


