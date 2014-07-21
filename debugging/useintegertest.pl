#!/usr/bin/perl
# File: useintegertest.pl

use strict;

my $total = &add(2.5,2.5);
print "\$total is $total\n";

sub add {
  #use integer;    # uncomment to see the effect of use integer;
  my(@args) = @_;
  my $total;
  my $value;
  foreach $value (@args) {
    $total += $value;
  }
  return $total;
}
