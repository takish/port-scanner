#!/usr/bin/perl
use Net::Ping;
use IO::Socket;

$host = $ARGV[0];
for($xx=1;$xx<=65536;$xx++){
$socket = IO::Socket::INET->new(PeerAddr => $host,
				PeerPort => $xx,
				Proto	 => 'tcp',
				Timeout  => 30);

if($socket){
print "port $xx is open!\n";
}else{
}
#print "port $xx is NOT open.\n ";
}

