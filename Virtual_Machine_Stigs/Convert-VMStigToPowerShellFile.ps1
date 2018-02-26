function New-VMPowershellScanFiles {
    
    [CmdletBinding()]
    PARAM(
        # _Manual-xccdf.xml file path
        [Parameter(Mandatory = $true,
            Position = 0)]
        [ValidateScript( {Test-Path $PSItem })]
        [string]
        $xccdf,
        # File path to save the STIG DSC Config file
        [Parameter(Mandatory = $false,
            Position = 1)]
        [string]
        $outPath
    )
    BEGIN {
        # Load the content as XML
        try { 
            [xml]$VMStig = Get-Content -Path $xccdf -EA Stop
        }
        catch {
            write-warning "Failure converting XML for the XCCDF file."
            Write-Error $PSItem -ErrorAction Stop
        }

    }# close BEGIN
    #region Process Registry Fixes
    PROCESS {

        ## loop through the xccdf benchmark collecting data into an object collection
        foreach ($Group in $VMStig.Benchmark.Group) {
            
            ## create a new PSObject collecting and stripping out as required.
            $STIG = New-Object -TypeName PSObject -Property ([ordered]@{
                    VID                  = $group.id
                    RuleID               = $group.rule.id
                    Check                = $group.rule.check.'check-content'
                })
            
            #$VIDLine = '$VID = ' + "$($STIG.VID)"      
            $FinalPath = $outPath + "\" + $STIG.RuleID + ".ps1"

$HereString = @"
`$VID = `"$($STIG.VID)`"

`$Value = ( `$VM | CHANGEME )

Switch ( `$Value -eq "CHANGEME" ) {
    `$True { `$Results = "NF" }
    `$False {
        `$Result = "OPEN"
        `$Text = "CHANGEME: '`$Value'. Must be 'CHANGEME'"
    }
}

$($STIG.Check)

"@
    
            $HereString | Out-File -FilePath $FinalPath -Force -Encoding ascii

            } # End Foreach

        } # End Process
    
} # End New-VMPowershellScanFiles

New-VMPowershellScanFiles -xccdf J:\STIG\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_STIG\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_Manual_STIG\U_VMware_vSphere_6-0_Virtual_Machine_STIG_V1R1_Manual-xccdf.xml -outPath J:\STIG\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_STIG\VM_Checks
    
