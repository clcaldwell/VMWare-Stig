$VID = "V-63311"

$Value = ( $VMHost | CHANGEME )

Switch ( $Value -eq "CHANGEME" ) {
    $True { $Result = "NF" }
    $False {
        $Result = "OPEN"
        $Text = "CHANGEME: '$Value'. Must be 'CHANGEME'"
    }
}

The downloaded ISO, offline bundle, or patch hash must be verified against the vendor's checksum to ensure the integrity and authenticity of the files. 
See some typical command line example(s) for both the md5 and sha1 hash check(s) directly below.
# md5sum <filename>.iso
# sha1sum <filename>.iso

If any of the system's downloaded ISO, offline bundle, or system patch hashes cannot be verified against the vendor's checksum, this is a finding.

