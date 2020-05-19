#!/usr/bin/env perl
# fxgen k f j
# outputs lnssub_ctf_<f>_<j>.vhd

use POSIX;
use Bit::Vector;
use AppConfig::Args;

my ($k, $f, $j) = @ARGV;

sub Db2 {
	my $z = shift;
	return log(abs(1 - 2**$z))/log(2)
}

my $f1_ezbits = $f+4;


sub DumpF1 {
	my $dh = 2 ** ($j - $f);
	my $esszero1 = log(1 - 2**(-(2**(-$f)))) / log(2.0) - $dh;
	my $count = 0;

	my $addr_Len = $f1_ezbits-$j;
	my $data_Len = $k+$f+1;

	#print "dh=$dh\n";
	for($i = 0; $i >= $esszero1; $i=$i-$dh) {
		unless($i == -$dh or $i == 0) {
			my $decval = POSIX::floor(Db2(-$i-$dh)*(2 ** $f)+0.5);
			
			my $decindex = Bit::Vector->new_Dec($addr_Len, $count);
			$decindex->Negate($decindex);
			my $index = $decindex->to_Bin();
			my $value = Bit::Vector->new_Dec($data_Len, $decval)->to_Bin();
			print "\t\"$value\" when \"$index\",\n";
		}
		$count++;
	}
}

sub DumpF2 {
	my $dh = 2 ** ($j-$f);
    my $esszero2 = 2 ** ($j-$f) - 2**(-$f);
	my $count = 0;
    
    my $addr_Len = $j;
    my $data_Len = $k+$f+1;
    
    for($i = 0 ; $i <= $esszero2 ; $i = $i + 2**(-$f)) {
		my $decval = POSIX::floor(Db2($i-$dh)*(2**$f)+0.5);
		my $index = Bit::Vector->new_Dec($addr_Len, $count)->to_Bin();
		my $value = Bit::Vector->new_Dec($data_Len, $decval)->to_Bin();
		print "\t\"$value\" when \"$index\",\n";
		
		
		$count++;
   }

}


print "-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT\n";

my $rom_Name = "LNSSub_CTF_F1_$f"."_".$j;
my $addr_Up = $f1_ezbits - 1;
my $addr_Down = $j;
my $data_Len = $k+$f+1;

print "library ieee;\n".
"use ieee.std_logic_1164.all;\n\n";

print "entity $rom_Name is\n".
"	port(\n".
"		Addr : in std_logic_vector(". $addr_Up ." downto $addr_Down);\n".
"		Val : out std_logic_vector(" . ($data_Len - 1) . " downto 0)\n".
"	);\n".
"end entity;\n".
"\n".
"architecture arch of $rom_Name is\n".
"begin\n".
"	with Addr select\n".
"		Val <= \n";

DumpF1;

print "\t\"" . '-' x ($data_Len) . "\" when others;\n".
"end arch;\n";

print "\n\n\n";

$rom_Name = "LNSSUB_CTF_F2_$f"."_".$j;
$addr_Up = $j-1;
$addr_Down = 0;
$data_Len = $k+$f+1;

print "library ieee;\n".
"use ieee.std_logic_1164.all;\n\n";

print "entity $rom_Name is\n".
"	port(\n".
"		Addr : in std_logic_vector(". $addr_Up ." downto $addr_Down);\n".
"		Val : out std_logic_vector(" . ($data_Len - 1) . " downto 0)\n".
"	);\n".
"end entity;\n".
"\n".
"architecture arch of $rom_Name is\n".
"begin\n".
"	with Addr select\n".
"		Val <= \n";

DumpF2;

print "\t\"" . '-' x ($data_Len) . "\" when others;\n".
"end arch;\n";

