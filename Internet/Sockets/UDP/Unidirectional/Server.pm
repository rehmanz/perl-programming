use strict;
use Socket;

use constant SIMPLE_UDP_PORT    => 4001;
use constant MAX_RECV_LEN       => 65536;
use constant LOCAL_INETNAME     => 'localhost';

my $trans_serv = getprotobyname( 'udp' );

my $local_host = gethostbyname( LOCAL_INETNAME );
my $local_port = SIMPLE_UDP_PORT;
my $local_addr = sockaddr_in( $local_port, $local_host );

socket( UDP_SOCK, PF_INET, SOCK_DGRAM, $trans_serv );
bind( UDP_SOCK, $local_addr );
my $data;

while( 1 ) {
    my $from_who = recv( UDP_SOCK, $data, MAX_RECV_LEN, 0 );
    if ( $from_who ) {
        my ( $the_port, $the_ip ) = sockaddr_in( $from_who );
        warn 'Received from ', inet_ntoa( $the_ip ), ": $data\n";
    }
    else {
        warn "Problem with recv: $!\n";
    }
}