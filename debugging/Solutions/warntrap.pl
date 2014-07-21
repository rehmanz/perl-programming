#!/usr/bin/perl
# File: warntrap.pl

$^W = 1;
$SIG{__WARN__} = \&handleIt;

print "$x\n";
print "$x again";

$y = 1;

sub handleIt {
  print "From handleIt: The warning is $_[0]\n";
}


