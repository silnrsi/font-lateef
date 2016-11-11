#!/bin/perl 

use strict;
use Getopt::Std;
use Pod::Usage;

my %opts;
getopts('f:hs', \%opts);  

unless (defined $ARGV[0] || defined $opts{h})
{
    pod2usage(1);
    exit;
}

if ($opts{h})
{
    pod2usage( -verbose => 2, -noperldoc => 1);
    exit;
}


my %fontName = (
	s => ['Scheherazade', 100],
	l => ['Lateef', 101],
	h => ['Harmattan', 102],
	n => ['Nastaliq', 103]
	);


# Discover input line-end conventions:
local $/ = \1028;
$_ = <>;
die "Can't discover line end convention" unless $_ =~ /(\015\012|\015|\012)/;
$/ = $1;
seek(ARGV,0, 0);


# Read column header line:

my (%col);
{
	$_ = <>;
	die "didn't find expected header line" unless /^Name/;
	s/[\015\012]*$//;		# platform independent chomp
	my @cols = split(/\t/);
	foreach (0 .. $#cols) { $col{lc($cols[$_])} = $_ };
}

my $whichSortCol = $opts{s} ? $col{shapeorder} : $col{order} ;

my $fontRE;


if ($opts{f})
{
	# make font ID a single lowercase char:
	$opts{f} = lc(substr($opts{f}, 0, 1));
	die "Font unknown: -f $opts{f}\n" unless exists $fontName{$opts{f}};
	print "%%FONTLAB ENCODING: ", $fontName{$opts{f}}[1] + ($opts{s} ? 100 : 0), "; ABS Glyph List $fontName{$opts{f}}[0]", $opts{s} ? ' shape-sorted' : '',"\n";
	$fontRE = qr/\*|$opts{f}/oi;
}
else
{
	print "%%FONTLAB ENCODING: ", 99 + ($opts{s} ? 100 : 0), "; ABS Glyph List", $opts{s} ? ' shape-sorted' : '',"\n";
	$fontRE = qr/./o;
}
my %wanted;

while (<>) {
	s/[\015\012]*$//;		# platform independent chomp
	next if /^\#/;
	my @x = split("\t");
	next if $x[0] =~ /^\s*$/ || $x[$col{fonts}] !~ $fontRE;
	warn "Sort column empty for $x[0]\n" if $x[$whichSortCol] eq '';
	$wanted{$x[0]} = $x[$whichSortCol];
}

foreach my $g (sort {$wanted{$a} <=> $wanted{$b}} keys %wanted)
{ print "$g\n"; }

=head1 TITLE

makeEncFile - Creates Fontlab Encoding file from absGlyphList data

=head1 SYNOPSIS

  makeEncFile [-f fontID] [-s] absGlyphList.txt > EncodingFile

=head1 OPTIONS

  -f fontID   a letter representing font family (S = Scheherazade, etc)
  -h          help message
  -s          use shape sorting rather than that needed for a build

=head1 DESCRIPTION

tba

=cut
