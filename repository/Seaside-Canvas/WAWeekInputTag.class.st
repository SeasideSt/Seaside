"
supported on:
- Opera 9
graceful degeneration to text input

A date consisting of a year and a week number encoded according to ISO 8601 [ISO8601]: four or more digits (0 to 9) representing the year, a hyphen (U+002D), a literal ""W"", and two digits for the week, zero-padded if necessary. All the numbers must be in base ten. The week number must be a number greater than or equal to 01. Week 01 of a given year is the week containing the 4th of January; weeks start on Monday. For instance: 2005-W52 is the week that ends on Sunday the first of January, 2006. The step attribute specifies the precision in weeks, defaulting to 1. This type is used most frequently for dates in European industry.
"
Class {
	#name : #WAWeekInputTag,
	#superclass : #WASteppedTag,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WAWeekInputTag >> type [
	^ 'week'
]
