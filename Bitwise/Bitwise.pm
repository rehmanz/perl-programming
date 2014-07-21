use strict;
use Data::Dumper;

# Main
#-----------------------------------------------------------------------------
test_bitwise();




# Tests
#-----------------------------------------------------------------------------
sub test_bitwise {
    #test_bit_wise_op();
    #test_shift();
    #test_mask();
    #test_ip_addr();
    #test_dec_to_bin();
    test_numbers();
}

#-----------------------------------------------------------------------------
#a = 1
#(a << 1) = 0x2 (2)
#(a << 1) = 0x4 (4)
#(a << 1) = 0x8 (8)
#(a << 1) = 0x10 (16)
#(a << 1) = 0x20 (32)
#(a << 1) = 0x40 (64)
#(a << 1) = 0x80 (128)
#(a << 1) = 0x100 (256)
#-----------------------------------------
#(a >> 1) = 0x80 (128)
#(a >> 1) = 0x40 (64)
#(a >> 1) = 0x20 (32)
#(a >> 1) = 0x10 (16)
#(a >> 1) = 0x8 (8)
#(a >> 1) = 0x4 (4)
#(a >> 1) = 0x2 (2)
#(a >> 1) = 0x1 (1)
#-----------------------------------------------------------------------------
sub test_shift {
    print_heading("Shift Operations");

    my $a = 1;
    
    printf "a = " . $a . "\n";
    for (my $i = 0; $i <= 7; $i++) {
        $a = ($a << 1);
        printf "(a << 1) = " . sprintf("%#x", $a) . " (" . $a . ")\n";
    }
    printf "-----------------------------------------\n";
    for (my $i = 0; $i <= 7; $i++) {
        $a = ($a >> 1);
        printf "(a >> 1) = " . sprintf("%#x", $a) . " (" . $a . ")\n";
    }
}

#-----------------------------------------------------------------------------
#1. a = 0
#2. ~a = ffffffff
#3. a = 1, b = 2, c = 3
#4. (a & b) = 0
#5. (a | b) = 3
#6. (a ^ b) = 3
#7. (a & c) = 1
#8. (a | c) = 3
#9. (a ^ c) = 2
#-----------------------------------------------------------------------------
sub test_bit_wise_op {
    print_heading("Bitwise Operations");
    
    my $a = 0x0;
    printf "1. a = " . $a . "\n";
    printf "2. ~a = " . sprintf("%x\n", ~$a);
    
    $a = 0x01;
    my $b = 0x02;
    my $c = 0x03;
    printf "3. a = " . $a . ", b = " . $b . ", c = " . $c ."\n";
    printf "4. (a & b) = " . ($a & $b) . "\n";
    printf "5. (a | b) = " . ($a | $b) . "\n";
    printf "6. (a ^ b) = " . ($a ^ $b) . "\n";
    printf "7. (a & c) = " . ($a & $c) . "\n";
    printf "8. (a | c) = " . ($a | $c) . "\n";
    printf "9. (a ^ c) = " . ($a ^ $c) . "\n";
}

#-----------------------------------------------------------------------------
#a = 0xffff
#(a & 0x1) = 0x1
#(a & 0x2) = 0x2
#(a & 0x3) = 0x3
#-----------------------------------------------------------------------------
sub test_mask {
    print_heading("Mask Operations");
    
    my $a = 0xffff;
    
    printf "a = " . sprintf("%#x", $a) . "\n";
    printf "(a & 0x1) = " . sprintf("%#x", ($a & 0x1)). "\n";
    printf "(a & 0x2) = " . sprintf("%#x", ($a & 0x2)). "\n";
    printf "(a & 0x3) = " . sprintf("%#x", ($a & 0b0011)). "\n";
}

sub test_ip_addr {
    print_heading("IP Address Test");
    
    my $ip = 0xc0a80072; #192.168.0.114
    my $ip_str = get_ip_addr($ip);
    printf "ip = " . $ip_str . "\n";
    
    my $ip_h = get_ip_hex($ip_str);
}

sub test_dec_to_bin {
    my $a = 48;
    printf "a = $a \n";
    #printf "a       = " . convert_to_bin($a) . "\n";
    printf "a(fast) = " . convert_to_bin_fast($a) . "\n";
    
    #my $b = 23;
    #printf "b = $b \n";
    #printf "b = " . convert_to_bin_fast($b) . "\n";
}

sub test_numbers {
    #test_odd_even();
    #test_count_ones();
    test_convert_to_bin();
}

sub test_odd_even {
    for (my $i=0; $i < 15; $i++) {
        printf "$i is " . get_num_type($i) . " number\n";
    }
}

sub test_count_ones {
    for (my $i=0; $i <= 15; $i++) {
        printf "$i has " . get_one_count($i) . " ones\n";
    }
}

sub test_convert_to_bin {
    for (my $i=0; $i <= 15; $i++) {
        printf "$i in bin: " . convert_to_bin($i) . "\n";
    }
}

# Helper Functions
#-----------------------------------------------------------------------------
sub get_one_count {
    my $n = shift;
    my $count = 0;
    
    while ($n) {
        $count += ($n & 1);
        $n = ($n >> 1);
    }
    
    return $count;
}

sub get_num_type {
    my $n = shift;

    if ($n & 0x1) {
        return "odd";
    } else {
        return "even";
    }
}

sub convert_to_bin {
    my $n = shift;
    my @s;
    
    while ($n) {
        unshift(@s,($n & 1));
        $n = ($n >> 1);
    }
    
    return "@s";
}

sub reverse_string {
    my $s = shift;
    my $i = 0;
    my $j = length($s) - 1;
    
    while ($i < $j) {
        my $head = substr($s,$i,1);
        my $tail = substr($s,$j,1);
        substr($s,$i,1,$tail);
        substr($s,$j,1,$head);
        $i++;
        $j--;
    }
    
    return $s;
}

sub get_ip_addr {
    my $ip   = shift;
    my $mask = 0xff;
    my (@ip_str, $t);
    
    for (my $i=0; $i <= 24; $i+=8) {
        
        $t = ($ip & $mask);
        $t = ($t >> $i);
        push (@ip_str, $t);
        
        $mask = ($mask << 8);
    } 
    
    printf "===> @ip_str \n";
    return "$ip_str[3].$ip_str[2].$ip_str[1].$ip_str[0]"
}

sub get_ip_addr_a {
    my $ip = shift;
    my ($ip_str, $t);
    my $mask = 0xff000000;

    for (my $i = 24; $i >= 0; $i = $i-8) {
        $t = ($ip & $mask);
        $t = ($t >> $i);
        
        $ip_str .= $t;
        if ($i != 0) {
            $ip_str .= ".";
        }
        
        $mask = ($mask >> 8);
    }
    
    return $ip_str;
}

sub ip_valid {
    my $ip = shift;
    my @tupples = split (/\./, $ip);
    
    for (my $i = 0; $i < 4; $i++) {
        if ($i == 0) {
            if (!(($tupples[$i] > 0) && ($tupples[$i] <= 255))) {
                return 0;
            }
        } else {
            if (!(($tupples[$i] >= 0) && ($tupples[$i] <= 255))) {
                return 0;
            }
        }
    }
    
    return 1;
}

sub get_ip_hex {
    my $ip = shift;
    my $ip_h;
    my @octets = split(/\./, $ip, 4);
    
    foreach my $octet (@octets) {
        $ip_h .= sprintf("%0x",$octet);
    }

    return $ip_h; 
}

sub print_heading {
    my $msg = shift;
    
    printf "\n";
    printf $msg . "\n";
    printf "--------------------------------------------\n";
}