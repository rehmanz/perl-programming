#!/usr/bin/perl
# File: dtest.pl

use strict;
my ($filename) = @ARGV;
open (FH, $filename) or die "Can't open $filename";
my $x = "123";
print "$x\n";
$x += 4;
print "$x\n";
while (my $line = <FH>) {
  print $line if ($line =~ /^p|^u/);
}
