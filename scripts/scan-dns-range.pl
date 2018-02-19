#!/usr/local/bin/perl
# Scan DNS Range
# I made this sometime in 2015 for practice.
# Not sure if it even still works or is useful.

# Initialize Global Variables
$dns     = 0;
$command = "";
$short   = "";
$result  = "";

$error = "ScanRange() argument missing. Exiting script.\n";


# ---Options-------------------------------------------------------------------
# CHECK_DNS option will print the DNS array to the console before any scans.
$CHECK_DNS = 1;


# ---DNS Array-----------------------------------------------------------------
# NOTE: Contains the DNS IPs that will be used during the scan. Include
#		additional DNS IPs by adding them with push as shown by the example.
@DNS;
push (@DNS, '8.8.8.8');       # Google
#push (@DNS, '0.0.0.0');      # Example

$dnsCount = @DNS; # Get size of DNS array

if($CHECK_DNS) {
	print "---DNS Array---\n";
	while($dns < $dnsCount) {
		print "DNS[$dns]: @DNS[$dns]\n";
		$dns++;
	}
}

# ---Scan Range Subroutine Calls-----------------------------------------------
# NOTE: Define the IP range for the ScanRange subroutine. Include additional
#       subroutine calls with ranges to be scanned as shown by the example.
# IPs--> [min-max].[min-max].[min-max].[min-max]
ScanRange(192, 192, 168, 168,   0, 255,   0, 255);
#ScanRange( 0,   0,   0,   0,   0,   0,   0,   0); # Example


# ===ScanRange() subroutine scans the defined IP ranges========================
# Displays the IP, DNS, and FQDN to the console.
# When calling define the min-max for each byte (8 values needed).
sub ScanRange {
	# IP Range = [min-max].[min-max].[min-max].[min-max]
	$byte1_min = @_[0];
	$byte1_max = @_[1];
	$byte2_min = @_[2];
	$byte2_max = @_[3];
	$byte3_min = @_[4];
	$byte3_max = @_[5];
	$byte4_min = @_[6];
	$byte4_max = @_[7];
	if(!defined $byte1_min) { die $error; }
	if(!defined $byte1_max) { die $error; }
	if(!defined $byte2_min) { die $error; }
	if(!defined $byte2_max) { die $error; }
	if(!defined $byte3_min) { die $error; }
	if(!defined $byte3_max) { die $error; }
	if(!defined $byte4_min) { die $error; }
	if(!defined $byte4_max) { die $error; }
	
	# Reinitialize needed global variables
	$dns     = 0;
	$command = "";
	$short   = "";
	$result  = "";

	print "--------IP----------------DNS------------FQDN------------------------\n";

	# Byte 1
	$byte1 = $byte1_min;
	while($byte1 <= $byte1_max) {
		# Byte 2
		$byte2 = $byte2_min;
		while($byte2 <= $byte2_max) {
			# Byte 3
			$byte3 = $byte3_min;
			while($byte3 <= $byte3_max) {
				# Byte 4
				$byte4 = $byte4_min;
				while($byte4 <= $byte4_max) {
					# DNS Array
					$dns = 0;
					while($dns < $dnsCount) {
						# Console command and output
						$command = sprintf("host %s.%s.%s.%s %s | grep pointer",
								   $byte1, $byte2, $byte3, $byte4, @DNS[$dns]);
						$command = `$command`; # Return command results
						$short   = (split(/\s+/, $command))[4];
						if(!$short) { $short = "---NULL---"; }
						$result  = sprintf("%16s | %16s | %-40s\n",
										   "$byte1.$byte2.$byte3.$byte4",
										   @DNS[$dns], $short);
						print $result;
						$dns++;
					}
					$byte4++;
				}
				$byte3++;
			}
			$byte2++;
		}
		$byte1++
	}
	print "\n";
}

# END OF FILE
