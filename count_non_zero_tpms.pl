#!/usr/bin/perl

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
