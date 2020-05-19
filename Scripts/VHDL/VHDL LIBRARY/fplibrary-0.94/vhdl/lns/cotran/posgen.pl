#!/usr/bin/env perl
# posgen.pl k f j
# outputs lnssub_pos_<f>_<j>.vhd


use POSIX;
use Bit::Vector;
use AppConfig::Args;

my ($k, $f, $j) = @ARGV;

sub Db2 {
	my $z = shift;
	return log(abs(1 - 2**$z))/log(2);
}

sub Sb2 {
	my $z = shift;
	return log(1 + 2**$z)/log(2);
}

sub SbArg {
	my $dh = 2 ** ($j - $f);
	my $z = shift;
	my $zh = (POSIX::floor($z / (1 << $j))) * (1 << $j) / (1 << $f);
	my $zl = ($z % (1 << $j)) / (1 << $f);
	#print "dh=$dh, z=$z, zl=$zl, zh=$zh\n";
	#print "zshift=".($z / (1 << $f))."\n";
	# db(zl-dh)-(z+db(-zh-dh))
	my $f1 = Db2(-$zh - $dh);
	my $f2 = Db2($zl - $dh);
	#print "f1=$f1, f2=$f2\n";
	return $f2 - ($z / (1 << $f) + $f1);
}

sub DumpPosTbl {
	my $dh = 2 ** ($j - $f);
	#my $esszero1 = log(1 - 2**(-(2**(-$f)))) / log(2.0) - $dh;

	#my $addr_Len = $k+$f+1;
	my $addr_Len = $j+2;
	my $data_Len = $f+1;
	
	my $step = 1;#2 ** (-$f);
	my $start = -2 * $dh * (1 << $f);
	my $end = - log(2 * 2 ** $dh - 1)/log(2) * (1 << $f);

	#print "start = $start, end = $end, step = $step\n";

	#print "dh=$dh\n";
	for($i = $start; $i <= $end; $i=$i+$step) {
		#unless($i+$dh == 0 or $i == 0) {
			my $sbarg = SbArg($i);
			#print "sbarg=$sbarg, ".$sbarg * (1 << $f) . "\n";
			my $decval = POSIX::floor(Sb2($sbarg)*(2 ** $f)+0.5);

			#my $zh = (POSIX::floor($i / (1 << $j))) * (1 << $j) / (1 << $f);
			#my $zl = ($i % (1 << $j)) / (1 << $f);
			#print "zh=$zh, zl=$zl\n";
			#my $db = Db2($zh-$dh);
			#my $dbexp = Db2($i / (1 << $f));
			#print "i=$i, db=$db, dbexp=$dbexp\n";
			#my $decval = POSIX::floor(($dbexp - $i / (1 << $f) - $db)*(2 ** $f)+0.5);
			
			my $decindex = $i;
			#print "addrlen=$addr_Len, decindex=$decindex\n";
			my $index = Bit::Vector->new_Dec($addr_Len, $decindex)->to_Bin();
			#print "decval = $decval, data_len = $data_Len\n";
			my $value = Bit::Vector->new_Dec($data_Len, $decval)->to_Bin();
			print "\t\"$value\" when \"$index\",\n";
		#}
	}
}


print "-- AUTOMATICALLY GENERATED FILE - DO NOT EDIT\n";

my $rom_Name = "LNSSub_CTF_Pos_$f"."_".$j;
#my $addr_Up = $k+$f;
my $addr_Up = $j+1;
my $addr_Down = 0;
my $data_Len = $f+1;

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

DumpPosTbl;

print "\t\"" . '-' x ($data_Len) . "\" when others;\n".
"end arch;\n";
