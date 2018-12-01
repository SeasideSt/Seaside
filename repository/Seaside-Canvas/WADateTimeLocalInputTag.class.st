"
supported on:
- Opera 9
graceful degeneration to text input

A date and time (year, month, day, hour, minute, second, fractions of a second) encoded according to ISO 8601 [ISO8601], with no time zone information: four or more digits (0 to 9) representing the year, a hyphen (U+002D), two digits for the month, a hyphen, two digits for the day, a literal ""T"", two digits for the hour, a colon (U+003A), two digits for the minute, optionally a colon and two digits for the second, and optionally (if the seconds are present) a period (U+002E) and one or more digits for the fraction of a second. All the numbers must be in base ten and zero-padded if necessary. If the seconds are omitted, they must be assumed to be zero. If the fraction is omitted, it must be assumed to be zero as well. For instance: 1995-12-31T23:59:59.99 or, representing the time 10 milliseconds later, 1996-01-01T00:00. The step attribute specifies the precision in seconds, defaulting to 60 (one minute).
"
Class {
	#name : #WADateTimeLocalInputTag,
	#superclass : #WASteppedTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WADateTimeLocalInputTag >> type [
	^ 'datetime-local'
]
