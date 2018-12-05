$VID = "V-64101"

$Value = @( 
    $( $VM | Get-UsbDevice ),
    $($VM | Where {$_.ExtensionData.Config.Hardware.Device.DeviceInfo.Label -match "usb"})
) 

# Ensure we have actual items in our array 
$Value = $Value | ? {$_}

Switch ( $Value -eq $Null ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "USB Devices found: '$Value'. Must not be present."
    }
}
