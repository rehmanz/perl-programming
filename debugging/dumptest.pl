#!/usr/bin/perl
# File: dumptest.pl

use Data::Dumper;
### Build a big, horkin' data structure...
my $topref = {
  key1 => [
    [ 'key1Elem1_1', 'key1Elem1_2', 'key1Elem1_3', 'key1Elem1_4' ],
    [ 'key1Elem2_1', 'key1Elem2_2',
      { key1Elem3_3Key1 => 'key1Elem3_3Key1-Value',
          key1Elem3_3Key2 => 'key1Elem3_3Key2-Value',
          key1Elem3_3Key3 =>
            { key1Elem3_3Key3_Key1 =>
              [
	        'key1Elem3_3Key3_Key1-Value1',
	        'key1Elem3_3Key3_Key1-Value2',
	        'key1Elem3_3Key3_Key1-Value3'
	      ]
            },
          },
        'key1Elem2_4']
      ],
  key2 => 'toprefKey2-value',
  key3 => 'toprefKey3-value',
  key4sub => sub { my $x = 'hello'; return $x }
};

my $x = "hello";
my $y = \$x;
@pkgB::x_arr = ('pkgB x_arr value 1','pkgB x_arr value 1');
$pkgB::x = "package B x value";
$pkgB::pkgC::z = "pkgC z value";

my $dumper = new Data::Dumper([$topref],['$topref']);
$dumper->Indent(1);
$dumper->Quotekeys(1);
$dumper->Purity(1);
print $dumper->Dump();
