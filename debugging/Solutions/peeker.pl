#!/usr/bin/perl
# File: peeker.pl

use strict;
use Devel::Peek('Dump');
my $x = 6;
my @y_arr = qw(x y z);
my %z_hash = ('key1' => 'x', 'key2' => 'y', 'key3' => 'z');

my $x_ref = \$x;
my $y_arr_ref = \@y_arr;
my $z_hash_ref = \%z_hash;

Devel::Peek::Dump($x);
Devel::Peek::Dump($x_ref);
Devel::Peek::Dump(\@y_arr);
Devel::Peek::Dump($y_arr_ref);
Devel::Peek::Dump(\%z_hash);
Devel::Peek::Dump($z_hash_ref);


