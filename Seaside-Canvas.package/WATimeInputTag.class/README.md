supported on:
- Opera 9
graceful degeneration to text input

A time (hour, minute, seconds, fractional seconds) encoded according to ISO 8601 [ISO8601] with no time zone: two digits (0-9) for the hour, a colon (U+003A), two digits for the minute, optionally a colon and two digits for the second, and optionally (if the seconds are present) a period (U+002E) and one or more digits for the fraction of a second. All the numbers must be in base ten and zero-padded if necessary. If the seconds are omitted, they must be assumed to be zero. If the fraction is omitted, it must be assumed to be zero as well. For instance: 23:59:00.00000 or 00:00:05. The step attribute specifies the precision in seconds, defaulting to 60. Times must be greater than or equal to 0 and must be less than 24 hours, in addition to any tighter restrictions placed on the control by the min and max attributes. Note that this type is not an elapsed time data type.

User agents are expected to show an appropriate widget, such as a clock. UAs should make it clear to the user that the time does not carry any time zone information. 