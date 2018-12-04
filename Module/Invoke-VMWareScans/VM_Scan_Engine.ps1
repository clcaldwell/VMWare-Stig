Function Scan-VirtualMachine {
    [CmdletBinding()]
    
    Param(
        [Parameter(
            Mandatory=$True,
            ValueFromPipeline=$True)]
        [VMware.VimAutomation.ViCore.Impl.V1.VM.UniversalVirtualMachineImpl[]]$VM,
    
        [Parameter(Mandatory=$False)]
        [ValidateScript({Test-Path $_})]
        [String]$ScanFileDirectory,

        [Parameter(Mandatory=$False)]
        [ValidateScript({Test-Path $_})]
        [String]$ScanFile
    )

    # Create constants / arrays / vars
    $STIGS = New-Object System.Collections.ArrayList
    $Results = New-Object System.Collections.ArrayList
    $ScanObjects = New-Object System.Collections.ArrayList

       
    # This function takes the lightweight scan objects, and adds the additional code to make a complete functional Scan codeblock, with a return object
    Function Generate-VMScanCode {

        param(
            [parameter(mandatory=$True)]
            $ScanObject
        )

        # If ScanObject comes in as Type 'PSVariable', expand and convert to ScriptBlock
        If ($ScanObject.GetType().Name -eq "PSVariable") {
            $VID = $ScanObject.Name
            $ScanObject = [ScriptBlock]$ScanObject.Value
        }

        $ScriptBlockPrepend = {
            $VID = $Null
            $Result = $Null
            $Text = $Null
        }

        $ScriptBlockAppend = {

            $ScanObjectProperties = @{
                'VID' = $VID
                'HostName' = $VM.Name
                'Result' = $Result
                'Text' = $Text
            }

            $Scan = New-Object –TypeName PSObject –Property $ScanObjectProperties
    
            Return $Scan
        }

        $ScriptBlock = [ScriptBlock]::Create(
            $ScriptBlockPrepend.ToString() + $ScanObject.ToString() + $ScriptBlockAppend.ToString()
        )

        Return $ScriptBlock
    }

    # Get the system Variables BEFORE we load the scan codeblocks
    # $Vars = get-variable

    # . $ScanFile

    # Get the system variables After we load the scan codeblocks. This is how we find all of the valid code scanblocks
    # $NewVars = Compare-Object $Vars (Get-Variable) -Property Name | Where {$_.Name -ne "Vars"} | Get-Variable

    If ($ScanFileDirectory) {
        $ScanFiles = @( (Get-ChildItem -Path $ScanFileDirectory -File:$True -Filter "*.ps1").FullName )
    }

    ForEach ( $ScanFile in $ScanFiles ) {
        $ScanObject = Get-Content $ScanFile -Raw
        $ScanObject = [ScriptBlock]::Create( $ScanObject )
        [Void]$ScanObjects.Add( $ScanObject )
    }

        # Take each scanblock in memory, and add all of the required boilerplate code to it via 'Generate-ScanCode' function. Add each completed scanblock to STIGS arraylist
        ForEach ($ScanObject in $ScanObjects) {
            $STIGScan = $Null
            $STIGScan = Generate-VMScanCode $ScanObject
            [Void]$STIGS.Add($STIGScan)
        }

    ForEach ($STIG in $STIGS) {
        ForEach ($VMObject in $VM) {
            Write-Verbose "Running Check on $VMObject"
            $Results += $(Invoke-Command -ScriptBlock $STIG -InputObject $VMObject)
        }
    }

Return $Results

}

