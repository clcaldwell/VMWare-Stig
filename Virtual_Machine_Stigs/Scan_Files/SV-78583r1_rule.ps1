$VID = "V-64093"

$Value = ( $VM | Get-FloppyDrive )

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Floppy Drive Found: '$Value'. Must not be present"
    }
}
