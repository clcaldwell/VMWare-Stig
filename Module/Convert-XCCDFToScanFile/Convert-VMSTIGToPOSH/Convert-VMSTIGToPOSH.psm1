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
            
            $ValueCommand = $Null
            $Value = $Null
            $Setting = $Null
            $Lines = $Null
            $HereString = $Null
            $FinalPath = $Null

            ## create a new PSObject collecting and stripping out as required.
            $STIG = New-Object -TypeName PSObject -Property ([ordered]@{
                    VID                  = $group.id
                    RuleID               = $group.rule.id
                    Check                = $group.rule.check.'check-content'
                })

        $Lines = $($STIG.Check).Split("`n")

        ForEach ( $Line in $Lines ) {
            
            If  ( $ValueCommand -eq $Null ) {
                if ( $Line -match "Get-AdvancedSetting -Name (\.?\w+\.\w+){1,10}" ) {
                    $ValueCommand = $Matches[0]
                    #default { $null }            
                }
            }

            If ( $ValueCommand ) {
                If ( $ValueCommand -match "(\.?\w+\.\w+){1,10}" ) {
                    $Value = $Matches[0]
                    #default { $null }
                }
            }
            
            $Setting = Switch -regex ( $Line ) {
                "If the virtual machine advanced setting (\.?\w+\.\w+){1,10} does not exist or is not set to true, this is a finding." { '$True' }
                "If the virtual machine advanced setting (\.?\w+\.\w+){1,10} does not exist or is not set to false, this is a finding." { '$False' }
                "If the virtual machine advanced setting (\.?\w+\.\w+){1,10} exists, this is a finding." { '$Null' }
                default { $Null }
            }
        
        }
            

        If ( ($ValueCommand) -and ($Value) -and ($Setting) ) {
            
            $FinalPath = $outPath + "\Automated\"  + $STIG.RuleID + ".ps1"
<#
$HereString = @"
`$VID = `"$($STIG.VID)`"

`$Value = ( `$VM | ${ValueCommand} ).Value

Switch ( `$Value -eq ${Setting} ) {
    `$True { `$Result = "NF" }
    `$False {
        `$Result = "OPEN"
        `$Text = "${Value}: '`$Value'. Must be '${Setting}'"
    }
}
"@
#>

$HereString = @"
`$Value = ( `$VM | ${ValueCommand} ).Value

`$IsFinding = ( `$Value -ne ${Setting} )

`$Text = "${Value}: '`$Value'. Must be '${Setting}'"
"@

        } Else {
         
            $FinalPath = $outPath + "\Manual\"  + $STIG.RuleID + ".ps1"

$HereString = @"
`$VID = `"$($STIG.VID)`"

`$Value = ( `$VM | CHANGEME )

Switch ( `$Value -eq "CHANGEME" ) {
    `$True { `$Result = "NF" }
    `$False {
        `$Result = "OPEN"
        `$Text = "CHANGEME: '`$Value'. Must be 'CHANGEME'"
    }
}

$($STIG.Check)

"@

        }

            #$FinalPath = $outPath + "\" + $STIG.RuleID + ".ps1"
            $HereString | Out-File -FilePath $FinalPath -Force -Encoding ascii

            } # End Foreach

        } # End Process
    
} # End New-VMPowershellScanFiles

New-VMPowershellScanFiles -xccdf J:\STIG\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_STIG\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_Manual_STIG\U_VMware_vSphere_6-0_Virtual_Machine_STIG_V1R1_Manual-xccdf.xml -outPath J:\STIG\U_VMware_vSphere_6-0_Virtual_Machine_V1R1_STIG\VM_Checks\
    
