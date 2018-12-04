# PHNSY Scan File for ESX Hosts (VMHosts)
# STIG_Full_Name: VMware vSphere ESXi 6.0 Security Technical Implementation Guide
# STIG_Version: 1
# STIG_Release: 4
# STIG_Rel_Date: 7/28/2017
# STOOL_STIG_Key: 273

$63147 = {
    $VID = '63147'
    
    $Value = ($VMHost.ExtensionData.Config.LockdownMode)

    Switch ($Value -eq "lockdownEnabled") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "LockdownMode: '$Value'. Must be 'lockdownEnabled'"
        }
    }
    
}

$63173 = {
    $VID = '63173'
    
    $Value = ($VMHost | get-advancedsetting -Name DCUI.Access).Value
    
    Switch ($Value -eq "root") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "DCUI.Access: '$Value'. Must be 'root'."
        }
    }
    
}

$63177 = {
    $VID = '63177'

    $Value = ($VMHost | get-advancedsetting -Name Syslog.global.logHost).Value

    Switch ($Value -eq "tcp://sphsvr304.phnsy.sy:1514") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logHost: '$Value'. Should be 'tcp://sphsvr304.phnsy.sy:1514'."
        }
    }
}
    
$63179 = {
    $VID = '63179'

    $Value = ($VMHost | get-advancedsetting -Name Security.AccountLockFailures).Value

    Switch ($Value -eq "3") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "AccountLockFailures: '$Value'. Must be '3'."
        }
    } 
}

$63181 = {
    $VID = '63181'

    $Value = ($VMHost | get-advancedsetting -Name Security.AccountUnlockTime).Value

    Switch ($Value -eq "900") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "AccountUnlockTime: '$Value'. Must be '900'."
        }
    }
}

$63183 = {
    $VID = '63183'

    $Value = ($VMHost | get-advancedsetting -Name Annotations.WelcomeMessage).Value

    Switch ($Value -ne $NULL) {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Annotations.WelcomeMessage is NULL"
        }
        
    }
}

$63185 = {
    $VID = '63185'

    $Value = ($VMHost | get-advancedsetting -Name Config.Etc.issue).Value

    Switch ($Value -ne $NULL) {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.Etc.issue is NULL"
        }
    }
}

$63229 = {
    $VID = '63229'

    $Value = ($VMHost | get-advancedsetting -Name Config.HostAgent.log.level).Value

    Switch ($Value -eq "info") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.log.level: '$Value'. Must be 'info'."
        }
    }
}

$63231 = {
    $VID = '63231'

    $Value = ($VMHost | get-advancedsetting -Name Security.PasswordQualityControl).Value

    Switch ($Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'"
        }
    }
}

$63237 = {
    $VID = '63237'

    $Value = ($VMHost | get-advancedsetting -Name Config.HostAgent.plugins.solo.enableMob).Value

    Switch ($Value -eq $False) {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.plugins.solo.enableMob: '$Value'. Must be 'TRUE'."
        }
    }
}

$63239 = {
    $VID = '63239'

    $Value = ($VMHost | get-VMHostService | Where {$_.Label -eq "SSH"}).Running

    Switch ($Value -eq $False) {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "SSH Service is Running. Must be disabled."
        }
    }
}

$63241 = {
    $VID = '63241'

    $Value = ($VMHost | get-VMHostService | Where {$_.Label -eq "ESXi Shell"}).Running

    Switch ($Value -eq $False) {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "ESXi Shell Service is Running. Must be disabled."
        }
    }
}

$63243 = {
    $VID = '63243'

    $Value = ($VMHost | get-VMHostAuthentication).DomainMembershipStatus

    Switch ($Value -eq "ok") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Host must be joined to a domain."
        }
    }
}

$63245 = {
    $VID = '63245'

    $Value = ($VMHost |  Select Name, ` @{N="HostProfile";E={$_ | Get-VMHostProfile}}, ` @{N="JoinADEnabled";E={($_ |
		 Get-VmHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory.Enabled}}, ` @{N="JoinDomainMethod";E={(($_ |
		 Get-VMHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory | Select -ExpandProperty Policy | 
			Where {$_.Id -eq "JoinDomainMethodPolicy"}).Policyoption.Id}}).JoinDomainMethod

    Switch ($Value -eq "FixedCamConfigOption") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "JoinDomainMethod: '$Value'. Must be 'FixedCamConfigOption'."
        }
    }
}

$63247 = {
    $VID = '63247'

    $Value = ($VMHost | Get-AdvancedSetting -Name Config.HostAgent.plugins.hostsvc.esxAdminsGroup).Value

    Switch ($Value -ne "ESX Admins") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.plugins.hostsvc.esxAdminsGroup: '$Value'. Must NOT be 'ESX Admins'."
        }
    }
}

$63251 = {
    $VID = '63251'

    $Value = ($VMHost | Get-AdvancedSetting -Name UserVars.ESXiShellInteractiveTimeOut).Value

    Switch ($Value -eq "600") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "UserVars.ESXiShellInteractiveTimeOut: '$Value'. Must be '600'."
        }
    }
}

$63253 = {
    $VID = '63253'

    $Value = ($VMHost | Get-AdvancedSetting -Name UserVars.ESXiShellTimeOut).Value

    Switch ($Value -eq "600") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "UserVars.ESXiShellTimeOut: '$Value'. Must be '600'."    
        }
    }
}

$63255 = {
    $VID = '63255'

    $Value = ($VMHost | Get-AdvancedSetting -Name UserVars.DcuiTimeOut).Value

    Switch ($Value -eq "600") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "UserVars.DcuiTimeOut: '$Value'. Must be '600'."    
        }
    }
}

$63259 = {
    $VID = '63259'

    $Value = ($VMHost | Get-AdvancedSetting -Name Syslog.global.logDir).Value

    Switch ($Value -eq "[phs_security_audit_logs] vmware") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logDir: '$Value'. Should be '[phs_security_audit_logs] vmware'."
        }
    }
}

$63261 = {
    $VID = '63261'

    $Value = ($VMHost | Get-VMHostNTPServer).Value

    Switch ($Value -eq "160.11.149.1") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "NTPServer: '$Value'. Should be '160.11.149.1'."
        }
    }
}

<#
$63263 = {
    $VID = '63263'

    $Value = (($vmhost | Get-esxcli).software.acceptance.get())

    Switch ($Value -eq "CommunitySupported") {
        $True {$Result = "OPEN"}
        $False {$Result = "NF"}
    }
}
#>

$63279 = {
    $VID = '63279'

    $Value = ($VMHost | Get-AdvancedSetting -Name Mem.ShareForceSalting).Value

    Switch ($Value -eq "2") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Mem.ShareForceSalting: '$Value'. Must be '2'."
        }
    }
}

$63281 = {
    $VID = '63281'

    $Value = ($VMHost | Get-VMHostFirewallException | Where {$_.Enabled -eq $true} | Select Name,Enabled,@{N="AllIPEnabled";E={$_.ExtensionData.AllowedHosts.AllIP}}) | ? {$_.AllIPEnabled -eq $True}

    Switch ($Value.Count -ge 1) {
        $True {$Result = "OPEN"}
        $False {
            $Result = "NF"
            $Text = "'AllIPEnabled' rule is applied to some Firewall rulesets."
        }
    }
}

$63283 = {
    $VID = '63283'

    $Value = ($VMHost | get-VMHostFirewallDefaultPolicy)

    Switch (($Value.incomingEnabled -eq $true) -or ($Value.OutgoingEnabled -eq $true)) {
        $True {$Result = "OPEN"}
        $False {$Result = "NF"}
    }
}

$63285 = {
    $VID = '63285'

    $Value = ($VMHost | Get-AdvancedSetting -Name Net.BlockGuestBPDU).Value

    Switch ($Value -eq "1") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Net.BlockGuestBPDU: '$Value'. Must be '1'."}
    }
}

$63293 = {
    $VID = '63293'

    $Value = ($VMHost | Get-AdvancedSetting -Name Net.DVFilterBindIpAddress).Value

    Switch ($Value -eq "") {
        $True {$Result = "NF"}
        $False {$Result = "OPEN"}
    }
}

$63465 = {
    $VID = '63465'
    
    $Value = ($VMHost.ExtensionData.Config.LockdownMode)

    Switch ($Value -eq "LockdownEnabled") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "LockdownMode: '$Value'. Must be 'lockdownEnabled'"
        }
    }
}

$63477 = {
    $VID = '63477'

    $Value = ($VMHost | get-advancedsetting -Name Syslog.global.logHost).Value

    Switch ($Value -eq "tcp://sphsvr304.phnsy.sy:1514") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logHost: '$Value'. Should be 'tcp://sphsvr304.phnsy.sy:1514'."
        }
    }
}

$63485 = {
    $VID = '63485'

    $Value = ($VMHost | get-advancedsetting -Name Annotations.WelcomeMessage).Value

    Switch ($Value -eq $NULL) {
        $True {$Result = "OPEN"}
        $False {
            $Result = "OPEN"
            $Text = "Annotations.WelcomeMessage is NULL"
        }
    }
}

$63509 = {
    $VID = '63509'

    $Value = ($VMHost | get-advancedsetting -Name Config.HostAgent.log.level).Value

    Switch ($Value -eq "info") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.log.level: '$Value'. Must be 'info'."
        }
    }
}

$63531 = {
    $VID = '63531'

    $Value = ($VMHost | get-advancedsetting -Name Security.PasswordQualityControl).Value

    Switch ($Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'."
        }
    }
}

$63605 = {
    $VID = '63605'

    $Value = ($VMHost | get-VMHostAuthentication).DomainMembershipStatus

    Switch ($Value -eq "ok") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Host must be joined to a domain."
        }
    }
}

$63757 = {
    $VID = '63757'

    $Value = (($VMHost | Get-VMHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory | Select -ExpandProperty Policy | ? {$_.id -eq 'JoinDomainMethodPolicy'}).PolicyOption.Id

    Switch ($Value -eq "FixedCamConfigOption") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "JoinDomainMethod: '$Value'. Must be 'FixedCamConfigOption'."
        }
    }
}

$63769 = {
    $VID = '63769'

    $Value = ($VMHost | Get-AdvancedSetting -Name Config.HostAgent.plugins.hostsvc.esxAdminsGroup).Value

    Switch ($Value -ne "ESX Admins") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.plugins.hostsvc.esxAdminsGroup: '$Value'. Must NOT be 'ESX Admins'."
        }
    }
}

$63773 = {
    $VID = '63773'

    $Value = ($VMHost | Get-AdvancedSetting -Name UserVars.ESXiShellInteractiveTimeOut).Value

    Switch ($Value -eq "600") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "UserVars.ESXiShellInteractiveTimeOut: '$Value'. Must be '600'."
        }
    }
}

$63775 = {
    $VID = '63775'

    $Value = ($VMHost | Get-AdvancedSetting -Name UserVars.ESXiShellTimeOut).Value

    Switch ($Value -eq "600") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "UserVars.ESXiShellTimeOut: '$Value'. Must be '600'."    
        }
    }
}

$63777 = {
    $VID = '63777'

    $Value = ($VMHost | Get-AdvancedSetting -Name UserVars.DcuiTimeOut).Value

    Switch ($Value -eq "600") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "UserVars.DcuiTimeOut: '$Value'. Must be '600'."    
        }
    }
}

$63779 = {
    $VID = '63779'

    $Value = $VMHost | Get-VMHostNTPServer

    Switch ($Value -eq "160.112.149.1") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "NTPServer: '$Value'. Should be '160.11.149.1'."
        }
    }
}

<#
$63263 = {
    $VID = '63263'

    $Value = (($vmhost | Get-esxcli).software.acceptance.get())

    Switch ($Value -eq "CommunitySupported") {
        $True {$Result = "OPEN"}
        $False {$Result = "NF"}
    }
}
#>

$63833 = {
    $VID = '63833'

    $Value = ($VMHost | get-advancedsetting -Name Syslog.global.logHost).Value

    Switch ($Value -eq "tcp://sphsvr304.phnsy.sy:1514") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logHost: '$Value'. Should be 'tcp://sphsvr304.phnsy.sy:1514'."
        }
    }
}

$63867 = {
    $VID = '63867'

    $Value = ($VMHost | get-advancedsetting -Name Security.PasswordQualityControl).Value

    Switch ($Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'."
        }
    }
}

$63885 = {
    $VID = '63885'

    $Value = ($VMHost | get-VMHostService | Where {$_.Label -eq "SSH"}).Running

    Switch ($Value -eq $False) {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "SSH Service is Running. Must be disabled."
        }
    }
}

$63893 = {
    $VID = '63893'

    $Value = ($VMHost | get-VMHostAuthentication).DomainMembershipStatus

    Switch ($Value -eq "ok") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Host must be joined to a domain."
        }
    }
}

$63895 = {
    $VID = '63895'

    $Value = ($VMHost |  Select Name, ` @{N="HostProfile";E={$_ | Get-VMHostProfile}}, ` @{N="JoinADEnabled";E={($_ |
		 Get-VmHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory.Enabled}}, ` @{N="JoinDomainMethod";E={(($_ |
		 Get-VMHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory | Select -ExpandProperty Policy | 
			Where {$_.Id -eq "JoinDomainMethodPolicy"}).Policyoption.Id}}).JoinDomainMethod

    Switch ($Value -eq "FixedCamConfigOption") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "JoinDomainMethod: '$Value'. Must be 'FixedCamConfigOption'."
        }
    }
}

$63897 = {
    $VID = '63897'

    $Value = ($VMHost | Get-AdvancedSetting -Name Config.HostAgent.plugins.hostsvc.esxAdminsGroup).Value

    Switch ($Value -ne "ESX Admins") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.plugins.hostsvc.esxAdminsGroup: '$Value'. Must NOT be 'ESX Admins'."
        }
    }
}

<#
$63901 = {
    $VID = '63901'

    $Value = (($vmhost | Get-esxcli).software.acceptance.get())

    Switch ($Value -eq "CommunitySupported") {
        $True {$Result = "OPEN"}
        $False {$Result = "NF"}
    }
}
#>

$63903 = {
    $VID = '63903'

    $Value = ($VMHost | get-advancedsetting -Name Syslog.global.logHost).Value

    Switch ($Value -eq "tcp://sphsvr304.phnsy.sy:1514") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logHost: '$Value'. Should be 'tcp://sphsvr304.phnsy.sy:1514'."
        }
    }
}

$63905 = {
    $VID = '63905'

    $Value = ($VMHost | get-advancedsetting -Name Security.PasswordQualityControl).Value

    Switch ($Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'."
        }
    }
}

$63907 = {
    $VID = '63907'

    $Value = ($VMHost | get-VMHostAuthentication).DomainMembershipStatus

    Switch ($Value -eq "ok") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Host must be joined to a domain."
        }
    }
}

$63909 = {
    $VID = '63909'

    $Value = ($VMHost |  Select Name, ` @{N="HostProfile";E={$_ | Get-VMHostProfile}}, ` @{N="JoinADEnabled";E={($_ |
		 Get-VmHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory.Enabled}}, ` @{N="JoinDomainMethod";E={(($_ |
		 Get-VMHostProfile).ExtensionData.Config.ApplyProfile.Authentication.ActiveDirectory | Select -ExpandProperty Policy | 
			Where {$_.Id -eq "JoinDomainMethodPolicy"}).Policyoption.Id}}).JoinDomainMethod

    Switch ($Value -eq "FixedCamConfigOption") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "JoinDomainMethod: '$Value'. Must be 'FixedCamConfigOption'."
        }
    }
}

$63911 = {
    $VID = '63911'

    $Value = ($VMHost | Get-AdvancedSetting -Name Config.HostAgent.plugins.hostsvc.esxAdminsGroup).Value

    Switch ($Value -ne "ESX Admins") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Config.HostAgent.plugins.hostsvc.esxAdminsGroup: '$Value'. Must NOT be 'ESX Admins'."
        }
    }
}

$63915 = {
    $VID = '63915'

    $Value = ($VMHost | get-advancedsetting -Name Syslog.global.logHost).Value

    Switch ($Value -eq "tcp://sphsvr304.phnsy.sy:1514") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logHost: '$Value'. Should be 'tcp://sphsvr304.phnsy.sy:1514'."
        }
    }
}

$63919 = {
    $VID = '63919'

    $Value = ($VMHost | get-advancedsetting -Name Security.PasswordQualityControl).Value

    Switch ($Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'."
        }
    }
}

$63921 = {
    $VID = '63921'

    $Value = ($VMHost | get-advancedsetting -Name Syslog.global.logHost).Value

    Switch ($Value -eq "tcp://sphsvr304.phnsy.sy:1514") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Syslog.global.logHost: '$Value'. Should be 'tcp://sphsvr304.phnsy.sy:1514'."
        }
    }
}

$63923 = {
    $VID = '63923'

    $Value = ($VMHost | get-advancedsetting -Name Security.PasswordQualityControl).Value

    Switch ($Value -eq "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15") {
        $True {$Result = "NF"}
        $False {
            $Result = "OPEN"
            $Text = "Security.PasswordQualityControl: '$Value'. Must be 'similar=deny retry=3 min=disabled,disabled,disabled,disabled,15'."
        }
    }
}