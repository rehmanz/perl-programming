use strict;
use Carp;

our $debug_flag = 0;

f1();

#http://www.perlmonks.org/?node_id=172938

sub f1 {
    local $debug_flag = 10;
    if ($debug_flag) {
        warn "f1: We are in debug mode!\n";
    }
    
    f2();
}

sub f2 {
    if ($debug_flag) {
        warn "f2: We are in debug mode #1!\n";
    }
    
    f3();
    if ($debug_flag) {
        warn "f2: We are in debug mode #2!\n";
    }
}

sub f3 {
    $debug_flag = 0;
    if ($debug_flag) {
        warn "f3: We are in debug mode!\n";
    }
}