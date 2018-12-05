$VID = "V-73133"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

If no clusters are enabled for VSAN, this is not applicable.

From the vSphere Web Client go to Host and Clusters >> Select a VSAN Enabled Cluster >> Manage >> Settings >> General >> Internet Connectivity >> Edit

If the HCL internet download is not required then ensure that "Enable Internet access for this cluster" is disabled. 

If this "Enable Internet access for this cluster" is enabled this is a finding.

If the HCL internet download is required then ensure that "Enable Internet access for this cluster" is enabled and that a proxy host is configured. 

If "Enable Internet access for this cluster" is disabled or a proxy is not configured this is a finding.


