#!/usr/bin/perl -w

use strict;

use File::Spec;
use Test::More;

use lib File::Spec->catdir( File::Spec->curdir, 't' );

use DateTime::TimeZone::LMT;

plan tests => 9;

my $LMT = new DateTime::TimeZone::LMT( longitude => 150 );
my $dt;

is( $LMT->longitude, 150, "We get the correct longitude returned" );

eval { $LMT->longitude(180) };
is( $@, '', "We can change the longitude" );
is( $LMT->offset, '+1200', "And the offset changes");
is( $LMT->longitude, 180, "And get the right response");

is( $LMT->longitude(120), 120, "We get the right response in a set-and-read");

eval { $LMT->name('new name') };
is( $@, '', "We can change the name" );
is( $LMT->name, 'new name', "And the name changes");
is( $LMT->longitude, 120, "But the longitude doesn't");
is( $LMT->offset, '+0800', "Nor does the offset");




