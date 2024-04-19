#!/usr/bin/perl

# Ran this by typing the following
# ls */RSEM.genes.results | perl -ne 'chomp; print "echo $_; perl count_non_zero_tpms.pl $_\n";' | sh
# output is at the bottom

use strict;
use warnings;

MAIN: {
    my $file = $ARGV[0] or die "usage: $0 RSEM.genes.results\n";
    open IN, $file or die "cannot open $file:$!";
    my $head = <IN>;
    my %seen = ();
    my $count = 0;
    while (my $line = <IN>) {
        next if ($line =~ m/^\s*$/);
        chomp $line;
        my @ff = split /\t/, $line;
        next unless ($ff[5] > 0);
        $ff[0] =~ m/(.*)\.t\d+$/ or die "unexpected";
        my $id = $1;
        next if ($seen{$id});
        $seen{$id}++;
        $count++;
    }
    print "$count\n";
}

# OUTPUT
# A1/RSEM.genes.results
# 923
# A2/RSEM.genes.results
# 1947
# A3/RSEM.genes.results
# 3263
# A4/RSEM.genes.results
# 13078
# A5/RSEM.genes.results
# 1844
# C1/RSEM.genes.results
# 1528
# C2/RSEM.genes.results
# 1793
# C3/RSEM.genes.results
# 2465
# C4/RSEM.genes.results
# 1845
# C5/RSEM.genes.results
# 2552
# Cho1/RSEM.genes.results
# 1455
# Cho2/RSEM.genes.results
# 566
# Cho3/RSEM.genes.results
# 307
# Cho4/RSEM.genes.results
# 623
# Cho5/RSEM.genes.results
# 92
