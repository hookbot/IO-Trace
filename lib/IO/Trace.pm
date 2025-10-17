package IO::Trace;

use 5.006000;
use strict;
use warnings;
use base qw(Exporter);

our @EXPORT = qw(iotrace);

our $VERSION = '0.021';

sub usage {
    die "Usage> $0 -o <output_log> CMD [ARGS]\n";
}

sub iotrace {
    my $context = wantarray;
    exit if !defined $context;
    my @args = @_ or usage;
    die "Not implemented";
}

1;
__END__

=head1 NAME

IO::Trace - Log I/O of an arbitrary process.

=head1 SYNOPSIS

  # Simple case:
  use IO::Trace;
  exit iotrace @ARGV;

  # Advanced use:
  use IO::Trace qw(iotrace);
  my $exit_sort = iotrace qw[-f -v -s9000 -tt -e execve,clone,openat,close,read,write -o /tmp/sort.iotrace.log sort];
  warn `wc /tmp/sort.iotrace.log`;
  exit $exit_editor;

=head1 DESCRIPTION

This utility is intended to be used to record STDIN STDOUT STDERR
actvity (read,write,close) of an arbitrary command which it spawns.
It does not alter any packets on the streams.

The log file format is similar to Linux's strace utility but more
platform-independent. So iotrace should work on Windows, MacOSX,
GitBash, FreeBSD, Msys2, MinGW, Solaris, Cygwin, ChromeOS,
as well as Linux.

This is implemented using IPC::Open3::open3 instead of Linux ptrace.

=head1 CAVEATS

It breaks terminal commands that rely on STDIN being a TTY because
it is converted into a pipe.

It will NOT log reads and writes to other files opened during
the command execution, like strace does.
It only logs STDIN, STDOUT, STDERR.

=head1 SEE ALSO

strace - Based on this commandline utility,
but this only works on Linux platform.

Capture::Tiny - Similar in that it can log STDOUT and STDERR,
but this is difficult to capture STDIN.

IPC::Run - Almost powerful enough to handle what I needed, but it
couldn't handle detecting closed streams very gracefully, and the
STDIN exponential backoff heartbeat CODE grinder is too sloppy.

=head1 AUTHOR

Rob Brown, E<lt>bbb@cpan.orgE<gt>

=head1 DEVELOPMENT

This module is maintained on github:

https://github.com/hookbot/IO-Trace

Report feature requests or bugs here:

https://github.com/hookbot/IO-Trace/issues

Pull requests welcome.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2025 by Rob Brown

This library is free software; you can redistribute it and/or
modify it under the terms of The Artistic License 2.0.

=head1 DISCLAIMER

Use at your own risk! The author will not be liable for any
damages caused by misuse of this application nor any illegal
monitoring or logging of any private communications or
data packets or IO streams.

=cut
