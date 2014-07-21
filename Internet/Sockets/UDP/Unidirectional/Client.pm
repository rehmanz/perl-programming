use strict;
use Socket;

use constant SIMPLE_UDP_PORT    => 4001;
use constant REMOTE_HOST        => 'localhost';

my $trans_serv  = getprotobyname( 'udp' );
my $remote_host = gethostbyname( REMOTE_HOST );
my $remote_port = SIMPLE_UDP_PORT;
my $destination = sockaddr_in( $remote_port, $remote_host );

socket( UDP_SOCK, PF_INET, SOCK_DGRAM, $trans_serv );

my $msg_count = 1;
my $big_chunk = 'x' x 65000;

while ($msg_count < 11) {
    my $data = $msg_count . ' -> ' . $big_chunk;
    send( UDP_SOCK, $data, 0, $destination )
        or warn "Send to socket failed: $msg_count\n";
    $msg_count++;
}

close UDP_SOCK;