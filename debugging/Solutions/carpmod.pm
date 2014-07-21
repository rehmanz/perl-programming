#!/usr/bin/perl
# File: carpmod.pm

package carpmod;
use Carp;

sub printWarnings {
  warn "This is your first warning.";
  warn "This is your second warning!";
  carp "This is your first warning.";
  carp "This is your second warning!";
}

1;


