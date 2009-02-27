#!/usr/bin/perl
use Net::Ping;
use IO::Socket;

print "[Start Scan]\n";
open (MACHINE,"hostlist");

# ex) hostlist
# 192.168.0.1
# 192.168.0.2
# 192.168.0.3
# 192.168.0.4
# 192.168.0.5
#      :
#      :

ping_check(MACHINE);

close(MACHINE);

sub ping_check
{
local($files)=@_;
$p = Net::Ping->new("icmp");

foreach $target (<$files>){
    foreach $addr ($target)
    {
	$flag=1;
	chop($addr);
	$host = gethostbyaddr(pack("C4",split(/\./,$addr)),2);
        print $host." is ";
unless ($p->ping($addr)){
	$flag=0;
	print "NOT \a"
}
        print "reachable.\n";
        sleep(1);
	port_check($addr) if($flag);
	sleep(1);
    }
}
    $p->close();
}
sub port_check{
local($addr)=@_;
for($xx=1;$xx<=1024;$xx++){
$socket = IO::Socket::INET->new(PeerAddr => $addr,
				PeerPort => $xx,
				Proto	 => 'tcp',
				Timeout  => 30);

if($socket){
print "port $xx is open!\n";
}else{
}
#print "port $xx is NOT open.\n ";
}
}
