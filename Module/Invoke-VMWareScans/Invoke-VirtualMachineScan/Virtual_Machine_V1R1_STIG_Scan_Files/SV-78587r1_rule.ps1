$VID = "V-64097"

$Value = ( $VM | Where-Object {$_.ExtensionData.Config.Hardware.Device.DeviceInfo.Label -match "parallel"} )

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Parallel Devices Found: '$Value'. Must not be present"
    }
}

