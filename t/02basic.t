#!/usr/bin/perl -w
#     t/02basic.t - checking time zone creation and usage
#     Test script for DateTime::TimeZone::LMT
#     Copyright (C) 2003, 2016 Rick Measham and Jean Forget
#
#     This program is distributed under the same terms as Perl:
#     GNU Public License version 1 or later and Perl Artistic License
#
#     You can find the text of the licenses in the F<LICENSE> file or at
#     L<http://www.perlfoundation.org/artistic_license_1_0>
#     and L<http://www.gnu.org/licenses/gpl-1.0.html>.
#
#     Here is the summary of GPL:
#
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 1, or (at your option)
#     any later version.
#
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software Foundation,
#     Inc., <http://www.fsf.org/>.
#

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





