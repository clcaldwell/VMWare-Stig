$ThisModule = $MyInvocation.MyCommand.Path -replace '\.Test\.ps1$'
Write-Host "ThisModule: $ThisModule"
$ThisModuleName = $ThisModule | Split-Path -Leaf
Write-Host "ThisModuleName: $ThisModuleName"
Get-Module -Name $ThisModuleName -All | Remove-Module -Force -ErrorAction Ignore
Import-Module -Name "$ThisModule.psm1" -Force -ErrorAction Stop

InModuleScope $ThisModuleName {

    Describe "Get-Setting_Test" {
        It "Makes sure correct Setting is returned" {
            Get-Setting -InputLine "blah blah verify it is set to 18 " | Should Be "18"
            Get-Setting -InputLine "blahblahblah verify it is set to root" | Should Be "root"
            Get-Setting -InputLine "blahblahblah verify it is set to root" | Should Be "root"
            Get-Setting -InputLine "verify it is set to 18 " | Should Be "18"
            Get-Setting -InputLine "blahblah If the marco.polo.marco.polo setting is not set to FindMarcoPolo " | Should Be "FindMarcoPolo"
            Get-Setting -InputLine "blah If the `"marco.polo.marco.polo`" keyword is set to `"Find MarcoPolo`" " | Should Be "Find MarcoPolo"
            Get-Setting -InputLine "blah * blah: HKLM\Path\PathyPath\SuperPathyPath blah\blah\blah/blah" | Should Be $null
            Get-Setting -InputLine "blah blah: blah_blah" | Should Be $null
            Get-Setting -InputLine "blah * blah: marco.polo.polopo blah/blah/blah" | Should Be $null
        }
    }

}
