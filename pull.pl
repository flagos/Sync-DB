#!/usr/bin/perl

use DBI;
 
$dbh = DBI->connect('dbi:mysql:openbravopos','lilibio','')
 or die "Connection Error: $DBI::errstr\n";
