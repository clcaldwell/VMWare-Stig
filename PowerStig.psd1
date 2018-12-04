# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

@{
# Script module or binary module file associated with this manifest.
RootModule = 'PowerStig.psm1'

# Version number of this module.
ModuleVersion = '2.3.0.0'

# ID used to uniquely identify this module
GUID = 'a132f6a5-8f96-4942-be25-b213ee7e4af3'

# Author of this module
Author = 'Adam Haynes'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2017 Adam Haynes. All rights reserved.'

# Description of the functionality provided by this module
Description = 'The PowerStig module provides a set of PowerShell classes to access DISA STIG settings extracted from the xccdf. The module provides a unified way to access the parsed STIG data by enabling the concepts of:
1. Exceptions (overriding and auto-documenting)
2. Ignoring a single or entire class of rules (auto-documenting)
3. Organizational settings to address STIG rules that have allowable ranges.

This module is intended to be used by additional automation as a lightweight portable “database” to audit and enforce the parsed STIG data.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
CLRVersion = '4.0'

# Modules that must be imported into the global environment prior to importing this module
RequiredModules  = @(
    @{ModuleName = 'AuditPolicyDsc'; ModuleVersion = '1.2.0.0'},
    @{ModuleName = 'AccessControlDsc'; ModuleVersion = '1.1.0.0'},
    @{ModuleName = 'FileContentDsc'; ModuleVersion = '1.1.0.108'},
    @{ModuleName = 'PolicyFileEditor'; ModuleVersion = '3.0.1'},
    @{ModuleName = 'SecurityPolicyDsc'; ModuleVersion = '2.4.0.0'},
    @{ModuleName = 'SqlServerDsc'; ModuleVersion = '11.4.0.0'},
    @{ModuleName = 'WindowsDefenderDsc'; ModuleVersion = '1.0.0.0'},
    @{ModuleName = 'xDnsServer'; ModuleVersion = '1.11.0.0'},
    @{ModuleName = 'xPSDesiredStateConfiguration'; ModuleVersion = '8.3.0.0'},
    @{ModuleName = 'xWebAdministration'; ModuleVersion = '2.2.0.0'},
    @{ModuleName = 'xWinEventLog'; ModuleVersion = '1.2.0.0'}
)

# DSC resources to export from this module
DscResourcesToExport = @(
    'Browser',
    'DotNetFramework',
    'FireFox',
    'IisServer',
    'IisSite',
    'Office',
    'OracleJRE',
    'SqlServer',
    'WindowsClient'
    'WindowsDnsServer',
    'WindowsFirewall',
    'WindowsServer'
)

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    'Get-OrgSettingsObject',
    'Get-DomainName',
    'Get-StigList',
    'New-StigCheckList'
)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'DSC','DesiredStateConfiguration','STIG','PowerStig'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/Microsoft/PowerStig/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Microsoft/PowerStig'

        # ReleaseNotes of this module
        ReleaseNotes = '* Windows 10 Fixes
  * V-63795 - Changed from manual to registry rule ## HIGH IMPACT CHANGE ##

* Windows Server 2012R2 Fixes
  * V-1089 - Corrected text
  * V-21954 - Changed from manual to registry rule ## HIGH IMPACT CHANGE ##
  * V-26070 - Corrected key path
  * V-36657 - Corrected key path
  * V-36681 - Corrected key path

* Added the following STIGs
  * IIS Server 8.5 STIG V1R5
  * Microsoft Outlook 2013 STIG V1R13
  * DotNet Framework 4.0 STIG V1R6
  * IIS Site 8.5 STIG V1R5
  * Windows Domain V2R11
  * FireFox 4.23 STIG
  * Windows Server 2012R2 DC V2R14
  * Windows Server 2012R2 MS V2R14
  * Windows 10 V1R15'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}