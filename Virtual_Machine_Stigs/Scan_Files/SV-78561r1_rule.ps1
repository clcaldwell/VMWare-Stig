$VID = "V-64071"

$Value = ( $VM | Get-AdvancedSetting -Name isolation.tools.trashFolderState.disable ).Value

Switch ( $Value -eq $True ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "isolation.tools.trashFolderState.disable: '$Value'. Must be '$True'"
    }
}
