#!/usr/bin/perl
use strict;
use warnings;

my $header = <>;
chomp $header;

my @h = split /\s+/, $header;
my @subject = @h[2 .. $#h];
my @sum = (0) x @subject;
my $count = 0;

printf "%-8s %-10s", $h[0], $h[1];

foreach my $s (@subject) {
	printf "%6s", $s;
}

printf "%6s %6s\n", "총점", "평균";

while (my $line = <>) {
	chomp $line;
	next if $line =~ /^\s*$/;

	my @f = split /\s+/, $line;
	my $total = 0;

	printf "%-8s %-10s", $f[0], $f[1];

	for (my $i = 2; $i <= $#f; $i++) {
		my $score = $f[$i];
		$total += $score;
		$sum[$i-2] += $score;

		printf "%6d", $score;
	}

	$count++;
	my $avg = $total / scalar(@subject);

	printf"%6d %6.1f\n", $total, $avg;
}

if ($count > 0) {
	printf "%-8s %-10s", "", "과목평균";

	foreach my $s (@sum) {
		printf "%6.1f", $s / $count;
	}

	print "\n";
}
