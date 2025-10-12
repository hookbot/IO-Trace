#!perl
use 5.006000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'IO::Trace',
    VERSION_FROM      => 'lib/IO/Trace.pm', # finds $VERSION, requires EU::MM from perl >= 5.5
    PREREQ_PM         => {'Test'        =>  0, }, # e.g., Module::Name => 1.1
    ABSTRACT_FROM     => 'lib/IO/Trace.pm', # retrieve abstract from module
    AUTHOR            => 'Rob Brown <bbb@cpan.org>',
    LICENSE           => 'artistic_2',
    EXE_FILES         => [ 'bin/iotrace' ],
);

package MY;

sub test {
    my $inherited = shift->SUPER::test(@_);
    my $sep = $^O eq 'MSWin32' ? ';' : ':';
    $inherited =~ s{(\Q$(FULLPERLRUN)\E)}{PATH=\$(INST_SCRIPT)$sep$sep\$(PATH) $1}g;
    return $inherited;
}
