#!/usr/bin/perl

use DBI;

require "config_pull.pl";

$dbh = DBI->connect('dbi:mysql:'.$POS_bd, $POS_user,$POS_pass)
 or die "Connection Error: $DBI::errstr\n";

$sql = "select CODE, UNITS from products INNER JOIN stockcurrent ON products.ID=stockcurrent.PRODUCT;";
    
$sth = $dbh->prepare($sql);
$sth->execute
    or die "SQL Error: $DBI::errstr\n";

 while (@row = $sth->fetchrow_array) {
     print "@row\n";
 } 

