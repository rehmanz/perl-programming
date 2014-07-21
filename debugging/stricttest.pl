#!/usr/bin/perl
# File: stricttest.pl

#use strict;
&strictVars();
&strictRefs();
&strictSubs();

sub strictVars {
  #use strict 'vars';
  @a = (6);
  print "strictVars: \@a is @a\n";	# Undeclared package var
}

sub strictRefs {
  #use strict 'refs';
  @names = ('Fido', 'Spot', 'Kiki');
  my $symRef = "names";
  print "strictRefs: \@\$symRef is @$symRef\n";	# Sym ref @'names'
}

sub strictSubs {
  #use strict 'subs';
  my $name = Francis;	# Bareword Francis used for quoted string
  print "strictSubs: \$name is $name\n";
}
