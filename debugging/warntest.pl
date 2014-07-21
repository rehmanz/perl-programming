#!/usr/bin/perl -w
# File: warntest.pl

print "\$^W is $^W\n"; # Turn on runtime warnings

while ($l = <STDIN>) {1;}

#BEGIN {
#  $SIG{__WARN__} = \&myWarning;
#}

print "x is '$x'\n";
&scopeIt();
print "z is '$z'\n";

warn "Warning: You should rotate your tires periodically.\n";

sub scopeIt {
  local $ = 0;
  print "y is '$y'\n";
}

sub myWarning {
  print "Got a warning that starts: '",
         substr($_[0],0,40), "...'\n";
}
