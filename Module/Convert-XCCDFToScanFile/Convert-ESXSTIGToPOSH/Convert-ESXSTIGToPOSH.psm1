function Get-Setting {
[CmdletBinding()]
Param( [String]$InputLine )
    $Setting = Switch -regex ( $InputLine ) {
        "If the `"?(\w*\.\w*)+`"? (setting|keyword) is (not)? set to (\w+)|(`"\w+`")|(`"[\w`= ]+`")|(`".+`")" {
            $( $Matches[0] -Replace "If the `"?(\w*\.\w*)+`"? (setting|keyword) is (not)? set to ","" ) 
       }
       "verify it is set to (`"?\w*`"?)" { 
           $( $Matches[0] -Replace "verify it is set to ","" ) 
       }
        default { $Null }
    }

    If ( $Setting -match "`".*`"" ) {
        $Setting = $Setting -Replace """",""
    }

    $Setting
}
function Convert-ESXSTIGToPOSH {
    
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
        $Lines = $Lines | Where-Object { !( [String]::IsNullOrWhiteSpace($_) ) }

        ForEach ( $Line in $Lines ) {
        
            
            If  ( $ValueCommand -eq $Null ) {
                if ( $Line -match "Get-AdvancedSetting -Name (\w*\.\w*)+" ) {
                    $ValueCommand = $Matches[0]
                }
            }
            Write-Verbose "ValueCommand: $ValueCommand"   

            If ( $ValueCommand ) {
                If ( $ValueCommand -match "(\w*\.\w*)+" ) {
                    $Value = $Matches[0]
                }
            }
            Write-Verbose "Value: $Value"

            If ( $Setting -eq $Null ) {
                $Setting = Get-Setting -InputLine $Line
            }
            Write-Verbose "Setting: $Setting"   
        
        }
            

        If ( ($ValueCommand) -and ($Value) -and ($Setting) ) {
            
            $FinalPath = $outPath + "\Automated\"  + $STIG.RuleID + ".ps1"

$HereString = @"
`$VID = `"$($STIG.VID)`"

`$Value = ( `$VMHost | ${ValueCommand} ).Value

Switch ( `$Value -eq `"${Setting}`" ) {
    `$True { `$Result = "NF" }
    `$False {
        `$Result = "OPEN"
        `$Text = "${Value}: '`$Value'. Must be '${Setting}'"
    }
}
"@

        } Else {
         
            $FinalPath = $outPath + "\Manual\"  + $STIG.RuleID + ".ps1"

$HereString = @"
`$VID = `"$($STIG.VID)`"

`$Value = ( `$VMHost | CHANGEME )

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
    
} # End Convert-ESXSTIGToPOSH
    
