$VID = "V-64099"

$Value = ( $VM | Where-Object {$_.ExtensionData.Config.Hardware.Device.DeviceInfo.Label -match "serial"} )

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "Serial Device Found: '$Value'. Must not be present"
    }
}
