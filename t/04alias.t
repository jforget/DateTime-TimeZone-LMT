#!/usr/bin/perl -w

use strict;

use File::Spec;
use Test::More;

use lib File::Spec->catdir( File::Spec->curdir, 't' );

use DateTime::TimeZone::LMT;

plan tests => 6;

my $LMT = new DateTime::TimeZone::LMT( longitude => 150 );
my $dt;

eval { $LMT->make_alias() };
is( $@, '', "Can make a TimeZone alias for default name LMT" );

eval { $LMT->make_alias('Longitude') };
is( $@, '', "Can make a TimeZone alias for custom name" );

eval { $dt = DateTime->now( time_zone => 'LMT' ) };
is( $@, '', "Can call DateTime->now with LMT" );

eval { $dt = DateTime->now( time_zone => 'Longitude' ) };
is( $@, '', "Can call DateTime->now with custom name" );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => 'Longitude', 
	)->set_time_zone( 'Australia/Melbourne' );
};
is( $dt->hour, 1, 'make sure that we can convert alias to Olson' );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => 'Longitude', 
	)->set_time_zone( 'LMT' );
};
is( $dt->hour, 1, 'make sure that we can convert custom name to LMT' );



