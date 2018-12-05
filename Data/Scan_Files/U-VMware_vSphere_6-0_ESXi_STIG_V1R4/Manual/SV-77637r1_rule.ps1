$VID = "V-63147"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

From the vSphere Web Client select the ESXi Host and go to Manage >> Settings >> System >> Security Profile.  Scroll down to "Lockdown Mode" and verify it is set to Enabled (Normal or Strict).

or

From a PowerCLI command prompt while connected to the ESXi host run the following command:

Get-VMHost | Select Name,@{N="Lockdown";E={$_.Extensiondata.Config.LockdownMode}}

If Lockdown Mode is disabled, this is a finding.  

For environments that do not use vCenter server to manage ESXi, this is not applicable.

