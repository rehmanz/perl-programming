use strict;
use Socket;

# Client.pm [remote-host [remote-port]]

use constant SIMPLE_UDP_PORT => 4001;
use constant REMOTE_HOST     => 'localhost';
use constant MAX_RECV_LEN    => 65536;

my $remote = shift || REMOTE_HOST;
my $remote_port = shift || SIMPLE_UDP_PORT;

my $trans_serv  = getprotobyname( 'udp' );

my $remote_host = gethostbyname( $remote )
    or die "udp_c5: name lookup failed: $remote\n";

my $destination = sockaddr_in( $remote_port, $remote_host );

socket( UDP_SOCK, PF_INET, SOCK_DGRAM, $trans_serv )
    or die "udp_c5: socket creation failed: $!\n";

my $msg_count = 1;

my $big_chunk = 'x' x 65000;

while ( $msg_count < 11 )
{
    my $data = $msg_count . ' -> ' . $big_chunk;

    warn "Sending $msg_count to server ...\n";

    send( UDP_SOCK, $data, 0, $destination )
        or warn "udp_c5: send to socket failed: $msg_count\n";

    sleep(1);

    my $from_who = recv( UDP_SOCK, $data, MAX_RECV_LEN, 0 );

    if ( $from_who )
    {
        my ( $the_port, $the_ip ) = sockaddr_in( $from_who );

        my $remote_name = gethostbyaddr( $the_ip, AF_INET ) || inet_ntoa( $the_ip );

        warn "Received from $remote_name: ", length( $data ),
            ' -> ', substr( $data, 0, 39 ), "\n";
    }
    else
    {
        warn "Problem with recv: $!\n";
    }

    $msg_count++;
}

close UDP_SOCK
    or die "udp_c5: close socket failed: $!\n";