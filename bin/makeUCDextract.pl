#! /usr/bin/perl

# Program to generate subset of UCD data related to our ABS font work:

# Parameter should be folder containing UCD data files. Default to 
#    "C:\Reference\Unicode\Unicode 6.1\ucd" on Windows
#    "/Volumes/DariusII/Unicode/Unicode 6.1/ucd" otherwise

# Changes
# 2016-10-13 bh
#   Change default datafile to 9.0
#   Remove now-standardized chars from __DATA__ 
# 2014-10-06 bh
#   Change default datafile to 7.0
#   Updated __DATA__ for African Feh, Qaf, Noon
# 2013-07-09 bh
#   Change default datafile to 6.3 (in beta at this time so could change!)
# 2013-01-05 bh
#   Change default datafile to 6.2
#   Added age to output
# 2011-05-31 bh
#   Updated __DATA__ for more expected additions
# 2011-02-09 bh
#   Change default datafile to 6.0
#   Updated __DATA__ to reflect expected additions to Unicode 6.1
# 2009-09-10 bh
#	Add joingroup to output.
# 2007-07-06 bh 
#   Uses glob() to find ucd beta files e.g. "ArabicShaping-5.1.0d1.txt"
#   Updated __DATA__ section to reflect PDAM4 that should be added to Unicode 5.1 but isn't in the data files yet
#   Added Name column to output


use strict;
use File::Spec::Functions;
use File::Glob ':glob';

my %isABS;	# Hash to remember what chars are ABS (as defined by Blocks.txt) or otherwise of interest

my %chars;	# Hash, indexed by integer Unicode, holding 
#	name	= character name
#	gen		= general category
#	class	= combining class
#	bidi	= bidi category
#	decomp	= decomposition
#   numtype = numeric type
#   mirror  = bidi mirrored
#	jointype = Arabic joining type

my ($usv, $name, $gen, $class, $bidi, $decomp, $numtype, $mirror, $jointype, $joingroup, $col4);
my ($u, %chars);


my $ucddir = $ARGV[0] || catdir (($^O eq 'MSWin32' ? 'C:' : '/Volumes/DariusII') , 'Reference', 'Unicode',  '9.0.0', 'ucd');

sub uopen
{
    my $pattern = shift;
    my @names = bsd_glob(catfile($ucddir, $pattern));
    die "syntax: $0 [Unicode_data_folder]\n" unless $#names >= 0;
    open IN, $names[-1] || die "Can't read $pattern from '$ucddir'";
}

# Read Blocks.txt to retrieve ranges of Unicode interested:
print STDERR "reading Blocks.txt...\n";
uopen "Blocks*.txt";
while (<IN>)
{
	chomp;
	next unless m/^([0-9A-F]{4,6})\.\.([0-9A-F]{4,6});.*Arabic/;
	map { $isABS{$_}=1 } (hex($1) .. hex($2));
}
close IN;

# other characters of interest:
map { $isABS{$_}=1 } (0x2000 .. 0x206F, 0x25CC); 

# Read our extra data first:
while (<DATA>)
{
	s/\s*$//;
	next if /^#/ or /^\s*$/;
	$name = undef;
	if (m/^([^;]*?)\s*;\s*(.*)$/)
	{
	    $name = $2;
	    $_ = $1;
	}
	($usv, $gen, $bidi, $col4, $joingroup) = split(' ', $_, 5);
	foreach (split(',', $usv))
	{
		$u = hex($_);
		$chars{$u} = {age => 'pending'};
		$chars{$u}{'gen'} = $gen if defined $gen;
		$chars{$u}{'bidi'} = $bidi if defined $bidi;
		if ($bidi eq 'NSM')
		{
		    $chars{$u}{'class'} = $col4 if defined $col4;
		}
		else
		{
			$chars{$u}{'jointype'} = $col4 if defined $col4;
			$chars{$u}{'joingroup'} = $joingroup if defined $joingroup;
		}
		if (defined $name)
		{
			$name .= ' (SIL PUA)' if chr($u) =~ /\p{Blk=PrivateUse}/;
			$chars{$u}{'name'} = $name;
		}
	}
	# Above fields will be overwritten by data from Unicode if such is available below.
}

# Read ArabicShaping.txt:
print STDERR "reading ArabicShaping.txt...\n";
uopen "ArabicShaping*.txt";
while (<IN>)
{
	chomp;
	next unless m/^[0-9-A-F]{4,6}/;
	# Unicode; Schematic Name; Joining Type; Joining Group
	($usv, undef, $jointype, $joingroup) = map { s/^\s+//; s/\s+$//; $_} split(';');
	$u = hex($usv);
	@{$chars{$u}}{qw(jointype joingroup)} = ($jointype, $joingroup) ;
}
close IN;
	

# Read UCD:
print STDERR "reading UnicodeData.txt...\n";
# add results to %chars, indexed by USV:
uopen "UnicodeData*.txt";
while (<IN>)
{
	chomp;
	($usv, $name, $gen, $class, $bidi, $decomp, undef, undef, undef, $mirror) = split(';');
	$u = hex($usv);
	if (exists $chars{$u} or $isABS{$u} or $mirror eq 'Y' or $u <= 255)
	{
		# These are the chars we want to study:
		@{$chars{$u}}{qw(name gen class bidi decomp mirror)} = ($name, $gen, $class, $bidi, $decomp, $mirror);
	}
	if ($decomp =~ /^<(initial|medial|isolated|final)> ([0-9A-F]{4,6})$/)
	{
		# Here is one of the compatibility forms:
		my $form = $1;
		my $u2 = hex($2);
		next unless exists $chars{$u2};
		$chars{$u2}{$form} = $usv;
	}
}
close IN;

# Read DerivedAge.txt
print STDERR "reading DerivedAge.txt...\n";
# add results to %chars, indexed by USV:
uopen 'DerivedAge*.txt';
while (<IN>)
{
	# Typical of derived data properties, this file includes both single codepoints and codepoint ranges. Example data:
	#   00A0..00AC    ; 1.1 #  [13] NO-BREAK SPACE..NOT SIGN
	#   00AD          ; 1.1 #       SOFT HYPHEN
	next if /^(#|\s*$)/;
    my ($start, $end, $age, $count, $name) = m/([0-9A-F]{4,6})(?:\.\.([0-9A-F]{4,6}))?[\s;]+(\S+)[\s#]+(?:\[(\d+)\]\s+)?(.*)$/o;
    $end = $start unless $end;
    foreach $u (hex($start) .. hex($end))
    {
    	$chars{$u}{'age'} = $age if exists $chars{$u};
    }
}
close IN;


# Output results in semicolon-separated cols:
print "#USV;General;Class;Bidi;Decomposition;Mirror;Joining;Isolated;Final;Medial;Initial;Name;Joingroup;Age\n";
for $u (sort {$a <=> $b} keys %chars)
{
	printf "%04X;", $u;
	map {print "$_;"} @{$chars{$u}}{qw(gen class bidi decomp mirror jointype isolated final medial initial name joingroup age)};
	print "\n";
}
__DATA__
# Extra data (PUA, proposed characters, etc.)
#USV        Gen BiDi  Jointype Joingroup   CC  ; NAME
# Examples:
#08B3        Lo  AL      D    AIN               ; ARABIC LETTER AIN WITH THREE DOTS BELOW
#08E3        Mn  NSM    220                     ; ARABIC INVERTED DAMMA BELOW
