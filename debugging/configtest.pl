#!/usr/bin/perl
# File: configtest.pl

use Config;

#print &Config::myconfig(),"\n";	# Returns "perl -V" info.

#print &Config::config_sh(),"\n";	# Full contents of config.h!

@cvars=qw(ccflags ldflags perlpath privlib sitearch sitelib);
&Config::config_vars(@cvars);
