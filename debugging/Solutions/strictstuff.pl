#!/usr/bin/perl
# File: strictstuff.pl

use strict 'vars';
use strict 'subs';
use strict 'refs';

# @critters = qw/cat dog frog/;
my @critters = qw/cat dog frog/;

# $dog = fido;
my $dog = 'fido';

# $fido = 'Hound';
my $fido = 'Hound';
$dog = \$fido;	# Hard ref, not symbolic ref.

print $$dog, "\n";


