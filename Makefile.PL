use 5.006000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'IO::Trace',
    VERSION_FROM      => 'lib/IO/Trace.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {'Test'        =>  0, }, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/IO/Trace.pm', # retrieve abstract from module
    AUTHOR            => 'Rob Brown <hookbot@p1s.plx.sd.apple.com>',
    #LICENSE           => 'perl',
    #Value must be from legacy list of licenses here
    #https://metacpan.org/pod/Module::Build::API
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
