package Data::Sah::Format::perl::sci2dec;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub format {
    my %args = @_;

    my $dt    = $args{data_term};

    my $res = {};

    $res->{expr} = join(
        "",
        "!defined($dt) ? $dt : ",
        "$dt =~ /\\A(?:[+-]?)(?:\\d+\\.|\\d*\\.(\\d+))[eE]([+-]?\\d+)\\z/ ? do { my \$n = length(\$1 || '') - \$2; \$n=0 if \$n<0; sprintf \"%.\${n}f\", $dt } : ",
        $dt,
    );

    $res;
}

1;
# ABSTRACT: Format scientific notation number as decimal number

=for Pod::Coverage ^(format)$

=head1 DESCRIPTION


=head1 FORMATTER ARGUMENTS
