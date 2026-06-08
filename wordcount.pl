#!/usr/bin/perl
use strict;
use warnings;

my %count;

while (my $word = <>) {
	chomp $word;

	next if $word =~ /^\s*$/;

	$count{$word}++;
}

foreach my $word (sort keys %count) {
	printf "%-20s %d\n", $word, $count{$word};
}
