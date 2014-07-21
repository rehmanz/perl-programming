use strict;
use Socket;

# Server.pm [port]

use constant SIMPLE_UDP_PORT => 4001;
use constant MAX_RECV_LEN    => 65536;

my $local_port = shift || SIMPLE_UDP_PORT;

my $trans_serv = getprotobyname( 'udp' );

my $local_addr = sockaddr_in( $local_port, INADDR_ANY );

socket( UDP_SOCK, PF_INET, SOCK_DGRAM, $trans_serv )
    or die "udp_s5: socket creation failed: $!\n";

bind( UDP_SOCK, $local_addr )
    or die "udp_s5: bind to address failed: $!\n";

my $data;

warn "Server starting up on port: $local_port.\n";

while( 1 ) 
{
    my $from_who = recv( UDP_SOCK, $data, MAX_RECV_LEN, 0 );

    if ( $from_who )
    {
        my ( $the_port, $the_ip ) = sockaddr_in( $from_who );

        my $remote_name = gethostbyaddr( $the_ip, AF_INET ) || inet_ntoa( $the_ip );

        warn "Received from $remote_name: ", length( $data ),
              ' -> ', substr( $data, 0, 39 ), "\n";

        sleep(3);

        warn "Sending back to client ... \n";

        send( UDP_SOCK, $data, 0, $from_who )
            or warn "udp_s5: send to socket failed.\n";
    }
    else
    {
        warn "Problem with recv: $!\n";
    }
}

