use IO::Socket;
my $sock = new IO::Socket::INET (
                                  LocalHost => 'localhost',
                                  LocalPort => '7070',
                                  Proto => 'tcp',
                                  Listen => 1,
                                  Reuse => 1,
                                 );
die "Could not create socket: $!\n" unless $sock;