#!/usr/bin/perl -w

use strict;

use File::Spec;
use Test::More;

use lib File::Spec->catdir( File::Spec->curdir, 't' );

use DateTime::TimeZone::LMT;

plan tests => 10;

my $LMT = new DateTime::TimeZone::LMT( longitude => 150 );
my $dt;

eval { $dt = DateTime->now( time_zone => $LMT ) };
is( $@, '', "Can call DateTime->now with LMT" );

eval { $dt->add( years => 50 ) };
is( $@, '', "Can add 50 years" );

eval { $dt->subtract( years => 400 ) };
is( $@, '', "Can subtract 400 years" );

eval { $dt = DateTime->new( year => 2000, month => 6, hour => 1, time_zone => $LMT ) };
is( $dt->hour, 1, 'make sure that local time is always respected' );

eval { $dt = DateTime->new( year => 2000, month => 12, hour => 1, time_zone => $LMT ) };
is( $dt->hour, 1, 'make sure that local time is always respected' );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => 'Australia/Melbourne', 
	)->set_time_zone( $LMT );
};
is( $dt->hour, 1, 'make sure that we can convert to LMT' );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => $LMT, 
	)->set_time_zone( 'Australia/Melbourne' );
};
is( $dt->hour, 1, 'make sure that we can convert from LMT to Olson' );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => $LMT, 
	)->set_time_zone( 'floating' );
};
is( $dt->hour, 1, 'make sure that we can convert from LMT to Floating' );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => $LMT, 
	)
	->set_time_zone( 'floating' )
	->set_time_zone( 'Australia/Melbourne' );
};
is( $dt->hour, 1, 'make sure that we can convert from LMT to Floating to Olson' );

eval { 
	$dt = DateTime->new( 
		year => 2003, month => 10, day => 18, hour => 1, 
		time_zone => $LMT, 
	)->set_time_zone( 'UTC' );
};
is( $dt->hour, 15, 'make sure that we can convert from LMT to UTC' );





