#!/usr/bin/perl -w

use strict;

use File::Spec;
use Test::More;

use lib File::Spec->catdir( File::Spec->curdir, 't' );

use DateTime::TimeZone::LMT;

plan tests => 52;

for (my $lat=0; $lat <= 360; $lat+=30) {
    my $tz = DateTime::TimeZone::LMT->new( 
	longitude => $lat-180, 
    );
    isa_ok( $tz, 'DateTime::TimeZone::LMT' );
    is( $tz->longitude, $lat-180, 'Longitude is remembered' );
    is( $tz->is_floating, 0, 'should not be floating' );
    is( $tz->is_utc, 0, 'should not be UTC' );
}





