#!/usr/bin/perl

use DBI;

require "config_push.pl";

open(FIC,"<$ARGV[0]") or die("open: $!");
my $l;
my %stock = ();
my @parsing = ();
while( defined( $l = <FIC> ) )
{
 @parsing = split(/ /, $l);
 $stock{$parsing[0]}= $parsing[1];
}

print "host: ".$Presta_host;
print "port: ".$Presta_port;
print "DB: ".$Presta_db;
print "user: ".$Presta_login;
print "pass: ".$Presta_pass."\n";


my $dbh = DBI->connect('dbi:mysql:'.$Presta_db.':'.$Presta_host.':'.$Presta_port, $Presta_login,$Presta_pass)
 or die "Connection Error: $DBI::errstr\n";

$sql = "select id_product, quantity from ps_product;";

$sth = $dbh->prepare($sql);
$sth->execute
    or die "SQL Error: $DBI::errstr\n";

     while (@row = $sth->fetchrow_array) {
         # print "@row\n";
	   }

while( my ($k,$v) = each(%stock) )
{
# Adjust stock in ps_product table
$sql = "UPDATE ps_product SET quantity=$v where ean13=$k ;";
	$sth = $dbh->prepare($sql);
	# print $sql ."\n";
	$sth->execute
		or die "SQL Error: $DBI::errstr\n";

# Adjust stock in ps_product_attribute table
	$sql = "UPDATE ps_product_attribute SET quantity=$v where ean13=$k ;";
        # print $sql ."\n";
	$sth = $dbh->prepare($sql);
	$sth->execute
		or die "SQL Error: $DBI::errstr\n";

}
