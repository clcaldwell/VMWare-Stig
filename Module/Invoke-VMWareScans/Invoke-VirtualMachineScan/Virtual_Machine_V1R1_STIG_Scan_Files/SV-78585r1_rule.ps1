$VID = "V-64095"

$Value = ( $VM | Get-CDDrive | Where-Object {$_.extensiondata.connectable.connected -eq $true} )

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CD/DVD Drive Found: '$Value'. Must not be present"
    }
}

