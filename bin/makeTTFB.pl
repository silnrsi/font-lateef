#! /usr/bin/perl

use strict;

# Discover input line-end conventions:
local $/ = \1028;
$_ = <>;
die "Can't discover line end convention" unless $_ =~ /(\015\012|\015|\012)/;
$/ = $1;
seek(ARGV,0, 0);

# Read column header line:
my %col;
{
	$_ = <>;
	s/[\015\012]*$//;		# platform independent chomp
	die "didn't find expected header line" unless /^Name/;
	my @cols = split(/\t/);
	foreach (0 .. $#cols) { $col{$cols[$_]} = $_ };
}

print << 'EOT';
<?xml version="1.0"?>
<font>
EOT
while (<>) {
	s/[\015\012]*$//;		# platform independent chomp
	next if /^\#/;
	my @f;
	@f = split(/\t/);
	next if $f[0] eq '';
	next if $f[$col{'base'}] eq '';
#	next if $f[$col{'UnicodeVer'}] ne "5.1";
	print "<glyph PSName=\"$f[0]\"";
	print " UID=\"$f[$col{'USV'}]\"" if $f[$col{'USV'}] ne "";
	print ">\n"; 
	if ($f[$col{'base'}] eq '') {
		print "<base PSName=\"$f[0]\"/>\n";
	}
	else {
		print " <base PSName=\"$f[$col{'base'}]\">\n";
		for ( 'above', 'below', 'center', 'ring', 'through', 'aboveLeft' ) {
			if ($f[$col{$_}] ne '') {
				print "  <attach PSName=\"$f[$col{$_}]\" at=\"$_\" with=\"_$_\"/>\n";
			}
		}
		print " </base>\n";
	}
	print "</glyph>\n";
}
print "</font>\n";
