$VID = "V-73135"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

If no clusters are enabled for VSAN, this is not applicable.

From the vSphere Web Client go to Host and Clusters >> Select a Cluster >> Related Objects >> Datastores. Review the datastores. Identify any datastores with "vsan" as the datastore type.

or

From a PowerCLI command prompt while connected to the vCenter server run the following command:

If($(Get-Cluster | where {$_.VsanEnabled} | Measure).Count -gt 0){
Write-Host "VSAN Enabled Cluster found"
Get-Cluster | where {$_.VsanEnabled} | Get-Datastore | where {$_.type -match "vsan"}
}
else{
Write-Host "VSAN is not enabled, this finding is not applicable"
}

If VSAN is Enabled and the datastore is named "vsanDatastore" this is a finding. 


