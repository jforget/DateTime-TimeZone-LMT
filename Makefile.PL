use 5.005;
use ExtUtils::MakeMaker;



WriteMakefile(
	'NAME'		=> 'DateTime::TimeZone::LMT',
	'VERSION_FROM'	=> 'lib/DateTime/TimeZone/LMT.pm',
	'PREREQ_PM'		=> {
		DateTime => 0.12,
	},
	AUTHOR        => 'Rick Measham <rickm@cpan.org>'
);
