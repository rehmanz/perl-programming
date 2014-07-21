use Thread;

my $t1 = Thread->new(\&add,  10, 20);
my $t2 = Thread->new(\&mult, 10, 10);

my $ret1 = $t1->join();
my $ret2 = $t2->join();

printf "ret1 = $ret1\n";
printf "ret2 = $ret2\n";

sub add {
    my ($x, $y) = @_;
    sleep(10);
    return $x+$y;
}

sub mult {
    my ($x, $y) = @_;
    return $x*$y;
}
