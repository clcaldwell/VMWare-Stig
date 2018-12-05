# This function takes the lightweight scan objects, and adds the additional code to make a complete functional Scan codeblock, with a return object
Function New-VMScanCode {
[CmdletBinding()]
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
        
        $VMName = $VM.ExtensionData.Guest.HostName
        
        If ( -not $VMName ) {
            If ( $VM.Name -notmatch "[ ]+" ) {
                $VMName = $VM.Name
            } Else {
                Write-Verbose "Unable to find VM Name, aborting"
                Break
            }
        }

        $ScanObjectProperties = @{
            'VID' = $VID
            'HostName' = $VMName
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

Function Invoke-VirtualMachineScan {
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

       
    # Get the system Variables BEFORE we load the scan codeblocks
    # $Vars = get-variable

    # . $ScanFile

    # Get the system variables After we load the scan codeblocks. This is how we find all of the valid code scanblocks
    # $NewVars = Compare-Object $Vars (Get-Variable) -Property Name | Where {$_.Name -ne "Vars"} | Get-Variable

    If ($ScanFileDirectory) {
        $ScanFiles = @( (Get-ChildItem -Path $ScanFileDirectory -File:$True -Filter "*.ps1").FullName )
        If ( Get-ChildItem -Path $ScanFileDirectory -Name "Site-Specific" -Directory ) {
            $ScanFiles += (Get-ChildItem -Path "$ScanFileDirectory\Site-Specific\" -File:$True -Filter "*.ps1").FullName
        }
    }

    ForEach ( $ScanFile in $ScanFiles ) {
        $ScanObject = Get-Content $ScanFile -Raw
        $ScanObject = [ScriptBlock]::Create( $ScanObject )
        [Void]$ScanObjects.Add( $ScanObject )
    }

        # Take each scanblock in memory, and add all of the required boilerplate code to it via 'Generate-ScanCode' function. Add each completed scanblock to STIGS arraylist
        ForEach ($ScanObject in $ScanObjects) {
            $STIGScan = $Null
            $STIGScan = New-VMScanCode $ScanObject
            [Void]$STIGS.Add( $STIGScan )
        }

    ForEach ($STIG in $STIGS) {
        ForEach ($VMObject in $VM) {
            Write-Verbose "Running Check on $VMObject"
            [Void]$Results.Add( $(Invoke-Command -ScriptBlock $STIG -InputObject $VMObject) )
        }
    }

Return $Results

}

