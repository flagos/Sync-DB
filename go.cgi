#!/usr/bin/perl

use CGI qw(:standard);

require "config.pl";

print header;
print start_html('Synchronize openbravo POS -> prestashop'),
    h1('Synchronize openbravo POS -> prestashop'),
    start_form,
    "Openbravo POS host ",textfield(-name=>'POS_host',
				    -default=> $POS_host),
    "Openbravo POS port", textfield(-name=>'POS_port',
				    -default=>$POS_host),
    "Openbravo POS pass", textfield(-name=>'POS_pass',
				    -default=>$POS_pass),
    p,
    "Prestashop host ",textfield(-name=>'Presta_host',
				 -default=> $Presta_host),
    "Prestashop port", textfield(-name=>'Presta_port',
				 -default=> $Presta_port),
    "Prestashop pass", textfield(-name=>'Presta_pass',
				 -default=> $Presta_pass),
    p,
 
    submit,
    end_form,
    hr;

if (param()) {
    print 
	"Your POS is ",em(param('POS_host')), " port: ", em(param('POS_port')),
	p,
	"Your Prestashop is ",em(param('Presta_host'))," port: ", em(param('Presta_port')),

	hr;
}
print end_html;
