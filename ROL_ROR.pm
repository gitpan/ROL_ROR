
#  Copyright (c) 1997 by Steffen Beyer. All rights reserved.
#  This package is free software; you can redistribute it
#  and/or modify it under the same terms as Perl itself.

package ROL_ROR;

use strict;
use vars qw(@ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $VERSION);

require Exporter;
require DynaLoader;

@ISA = qw(Exporter DynaLoader);

@EXPORT = qw();

@EXPORT_OK = qw( bits_of_byte bits_of_short bits_of_int bits_of_long
ROL_byte ROR_byte ASL_byte LSR_byte ROL_short ROR_short ASL_short LSR_short
ROL_int ROR_int ASL_int LSR_int ROL_long ROR_long ASL_long LSR_long );

%EXPORT_TAGS = (all => [@EXPORT_OK]);

$VERSION = '1.0';

bootstrap ROL_ROR $VERSION;

1;

__END__

=head1 NAME

ROL_ROR - Rotate Left, Rotate Right

Implements rotate left, rotate right, arithmetic shift left and
logical shift right operations with carry flag for all C integer types

=head1 SYNOPSIS

=over 4

=item *

C<use ROL_ROR qw( bits_of_byte bits_of_short bits_of_int bits_of_long>
C<ROL_byte ROR_byte ASL_byte LSR_byte ROL_short ROR_short ASL_short LSR_short>
C<ROL_int ROR_int ASL_int LSR_int ROL_long ROR_long ASL_long LSR_long );>

import all (or some, by leaving some out) of the available operations
and functions

=item *

C<use ROL_ROR qw(:all);>

import all available operations and functions

=item *

C<$version = ROL_ROR::Version();>

returns the module's version number

=item *

C<$bits = bits_of_byte();>

=item *

returns the number of bits in a byte (unsigned char) on your machine

C<$bits = bits_of_short();>

returns the number of bits in an unsigned short on your machine

=item *

C<$bits = bits_of_int();>

returns the number of bits in an unsigned int on your machine

=item *

C<$bits = bits_of_long();>

returns the number of bits in an unsigned long on your machine

=item *

C<($value,$carry) = ROL_byte($value);>

=item *

C<($value,$carry) = ROR_byte($value);>

=item *

C<($value,$carry) = ASL_byte($value,$carry);>

=item *

C<($value,$carry) = LSR_byte($value,$carry);>

=item *

C<($value,$carry) = ROL_short($value);>

=item *

C<($value,$carry) = ROR_short($value);>

=item *

C<($value,$carry) = ASL_short($value,$carry);>

=item *

C<($value,$carry) = LSR_short($value,$carry);>

=item *

C<($value,$carry) = ROL_int($value);>

=item *

C<($value,$carry) = ROR_int($value);>

=item *

C<($value,$carry) = ASL_int($value,$carry);>

=item *

C<($value,$carry) = LSR_int($value,$carry);>

=item *

C<($value,$carry) = ROL_long($value);>

=item *

C<($value,$carry) = ROR_long($value);>

=item *

C<($value,$carry) = ASL_long($value,$carry);>

=item *

C<($value,$carry) = LSR_long($value,$carry);>

=back

B<Note that the "carry" input value is always truncated to the least>
B<significant bit, i.e., input values for "carry" must be either 0 or 1!>

=head1 DESCRIPTION

This module implements rotate left, rotate right, arithmetic shift left
and logical shift right operations with carry flag for all C integer types.

The results depend on the number of bits that the integer types unsigned
char, unsigned short, unsigned int and unsigned long have on your machine.

The module automatically determines the number of bits of each integer type
and adjusts its internal constants accordingly.

How the operations work:

=over 4

=item ROL

ROtate Left

 carry:                           value:

 +---+            +---+---+---+---     ---+---+---+---+
 | 1 |  <---+---  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  <---+
 +---+      |     +---+---+---+---     ---+---+---+---+      |
            |                                                |
            +------------------------------------------------+

=item ROR

ROtate Right

                        value:                          carry:

        +---+---+---+---     ---+---+---+---+           +---+
 +--->  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  ---+---> | 1 |
 |      +---+---+---+---     ---+---+---+---+     |     +---+
 |                                                |
 +------------------------------------------------+

=item ASL

Arithmetic Shift Left

 carry                        value:                       carry
  out:                                                      in:
 +---+        +---+---+---+---     ---+---+---+---+        +---+
 | 1 |  <---  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  <---  | 1 |
 +---+        +---+---+---+---     ---+---+---+---+        +---+

=item LSR

Logical Shift Right

 carry                        value:                       carry
  in:                                                       out:
 +---+        +---+---+---+---     ---+---+---+---+        +---+
 | 1 |  --->  | 1 | 0 | 0 | 1  ...  1 | 0 | 1 | 1 |  --->  | 1 |
 +---+        +---+---+---+---     ---+---+---+---+        +---+

=back

=head1 SEE ALSO

perl(1), perlsub(1), perlmod(1), perlxs(1), perlxstut(1), perlguts(1).

=head1 VERSION

This man page documents ROL_ROR version 1.0.

=head1 AUTHOR

Steffen Beyer <sb@sdm.de>.

=head1 COPYRIGHT

Copyright (c) 1997 by Steffen Beyer. All rights reserved.

=head1 LICENSE AGREEMENT

This package is free software; you can redistribute it
and/or modify it under the same terms as Perl itself.

