supported on:
- Opera 9
graceful degeneration to text input

A numerical value. The step attribute specifies the precision, defaulting to 1.

Numbers must be submitted as a significand followed by an optional exponent. The significand is an optional minus sign (U+002D, "-"), an integer, and optionally a decimal point (U+002E, ".") and an integer representing the fractional part. The exponent is a lowercase literal letter "e", an optional minus sign, and an integer representing the index of a power of ten with which to multiply the significand to get the actual number. Integers are one or more decimal digits. If the exponent part is omitted its index of a power of ten must be assumed to be zero.

For example, negative-root-two, to 32 significant figures, would be -1.4142135623730950488016887242097e0, the radius of the earth given in furlongs, to an arbitrary precision, would be 3.17e4, and the answer to the life, the universe and everything could be any of (amongst others) 42, 0042.000, 42e0, 4.2e1, or 420e-1.

This format is designed to be compatible with scanf(3)'s %f format, ECMAScript's parseFloat, and similar parsers while being easier to parse than some other floating point syntaxes that are also compatible with those parsers.

The strings +0, 0e+0, and +1e+3 are all invalid numbers (the minus sign cannot be replaced by a plus sign for non-negative numbers, it must simply be omitted). Similarly, .42e2 is invalid (there must be at least one digit before the decimal point). UAs must not submit numbers in invalid formats (whatever the user might enter).

The submission format is not intended to be the format seen and used by users. UAs may use whatever format and UI is appropriate for user interaction; the description above is simply the submission format.