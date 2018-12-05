$VID = "V-63313"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

If vCenter Update Manager is used on the network it can be used to scan all hosts for missing patches.  From the vSphere Client go to Hosts and Clusters >> Update Manager tab and select scan to view all hosts??? compliance status.

If vCenter Update Manager is not used, a host???s compliance status must be manually determined by the build number.  The following VMware KB 1014508 can be used to correlate patches with build numbers.

If the ESXi host does not have the latest patches, this is a finding.

If the ESXi host is not on a supported release, this is a finding.

VMware also publishes Advisories on security patches, and offers a way to subscribe to email alerts for them.
https://www.vmware.com/support/policies/security_response

