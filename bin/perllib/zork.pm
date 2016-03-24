package zork;

use Font::TTF::Scripts::GDL;

use strict;
use vars qw($VERSION @ISA);
@ISA = qw(Font::TTF::Scripts::GDL);

$VERSION = "0.01";  # RMH   2016-02-17     Original based on existing code

*read_font = \&Font::TTF::Scripts::GDL::read_font;

sub make_name
{
    my ($self, $gname, $uni, $glyph) = @_;
    # Standard protocols:
    $gname =~ s/[:\(\)\{\}]//g;     # Eliminate problematic chars
    $gname =~ s{/.*$}{}o;           # Take first name if there are several 
    
    if ($gname =~ /^abs[A-Z]/)
    {
        # Special processing for abs names:
        $gname =~ s/\./_/og;   # Replace dot separators with underscore (do not lc)
        $gname;
    }
    else
    {
        $self->SUPER::make_name($gname, $uni, $glyph);
    }
}

print "zork initialized\n";
1;