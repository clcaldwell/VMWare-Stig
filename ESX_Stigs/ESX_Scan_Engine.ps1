Function Scan-ESXHost 
{
    [CmdletBinding()]
    
    Param(
        [Parameter(
            Mandatory=$True,
            ValueFromPipeline=$True)]
        [VMware.VimAutomation.ViCore.Impl.V1.Inventory.VMHostImpl[]]$VMHost,
    
        [Parameter(Mandatory=$True)]
        [ValidateScript({Test-Path $_})]
        [String[]]$ScanFile
    )

    # Create constants / arrays / vars
    $STIGS = New-Object System.Collections.ArrayList
    $Results = New-Object System.Collections.ArrayList

    # This function takes the lightweight scan objects, and adds the additional code to make a complete functional Scan codeblock, with a return object
    Function Generate-ESXScanCode {

        param(
            [parameter(mandatory=$True)]
            $ScanObject
        )

        # If ScanObject comes in as Type 'PSVariable', expand and convert to ScriptBlock
        If ($ScanObject.GetType().Name -eq "PSVariable") {
            $VID = $ScanObject.Name
            $ScanObject = [ScriptBlock]$ScanObject.Value
        }

        $ScriptBlockAppend = {

            $ScanObjectProperties = @{
                'VID' = $VID
                'HostName' = $VMHost.Name
                'Result' = $Result
                'Text' = $Text
            }

            $Scan = New-Object –TypeName PSObject –Property $ScanObjectProperties
    
            Return $Scan
        }

        $ScriptBlock = [ScriptBlock]::Create($ScanObject.ToString() + $ScriptBlockAppend.ToString())

        Return $ScriptBlock
    }

    # Get the system Variables BEFORE we load the scan codeblocks
    $Vars = get-variable

    . $ScanFile

    # Get the system variables After we load the scan codeblocks. This is how we find all of the valid code scanblocks
    $NewVars = Compare-Object $Vars (Get-Variable) -Property Name | Where {$_.Name -ne "Vars"} | Get-Variable

        # Take each scanblock in memory, and add all of the required boilerplate code to it via 'Generate-ScanCode' function. Add each completed scanblock to STIGS arraylist
        ForEach ($Var in $NewVars) {
            $STIGScan = $Null
            $STIGScan = Generate-ESXScanCode $Var
            $STIGS.Add($STIGScan) | Out-Null
        }

    ForEach ($STIG in $STIGS) {
        ForEach ($VMHostObject in $VMHost) {
            Write-Verbose "Running Check on $VMHostObject"
            $Results += $(Invoke-Command -ScriptBlock $STIG -InputObject $VMHostObject)
        }
    }

Return $Results

}

