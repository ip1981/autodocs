#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use locale;
use open qw( :utf8 :std :encoding(UTF-8) );

my %items = ();

while (my $s = <STDIN>)
{
	if ($s =~ m/^\\indexentry{(.*)\s*@\s*type\s*=\s*([0-9]+)\s*hours\s*=\s*([0-9]+)}{[0-9]+}$/)
	{
		if (! exists($items{$1}))
		{                #  лк пр лб ...
			@{$items{$1}} = (0, 0, 0, 0, 0, 0, 0, 0, 0);
		}

		$items{$1}[$2] += $3;

	}
}

print "\\def\\stat{\n";

for my $item (sort(keys %items))
{
	my @hours = @{$items{$item}};
	my $row = "\\multicolumn{2}{c|}{} & $item & ";
	for my $i (0..8)
	{
		$row .= ' & ' . ($hours[$i] > 0 ? $hours[$i] : '');
	}
	$row .= " \\\\ \n";
	$row .= "\\hhline{~~-------------}\n\n";

	print $row;
}

print "}\n";

exit(0);

