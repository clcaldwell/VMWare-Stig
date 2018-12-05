$VID = "V-64051"

$Value = @($VM | Get-HardDisk).Persistence

Switch ( $Value -contains "IndependentNonPersistent" ) {
    $False { $Result = "NF" }
    $True {
        $Result = "OPEN"
        $Text = "One of this VM's Disks is: 'IndependentNonPersistent'. Must be changed to 'IndependentPersistent'"
    }
}
