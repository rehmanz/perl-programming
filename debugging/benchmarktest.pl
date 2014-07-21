#!/usr/bin/perl
# File: benchmarktest.pl

use strict;
use Benchmark;

timethese(100000,{'add' => '$i = $i + 1', 
	'autoincr' => '$i++'});
print timestr(timeit(100000,'$i + 6 + 10/3')),"\n";
timethis(100000,'$i + 6 + 10/3');
my $i = 0;
my $t1 = new Benchmark;
while (($i=$i+1) < 1000000){};
my $t2 = new Benchmark;
print '$i=$i+1  ',timestr(timediff($t2,$t1)),"\n";

$i = 0;
$t1 = new Benchmark;
while ($i++ < 1000000){};
$t2 = new Benchmark;
print '$i++     ',timestr(timediff($t2,$t1)),"\n";

$i = 0;
$t1 = new Benchmark;
while (($i += 1) < 1000000){};
$t2 = new Benchmark;
print '$i += 1  ',timestr(timediff($t2,$t1)),"\n";

