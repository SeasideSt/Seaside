"
A RRRfc822DateTime is holds on to a DateAndTime and a timezone string. It is mainly used for correct formatting of RSS items. You can also use your native classes if they support the correct printing methods.

Instance Variables
	dateAndTime:		<DateAndTime>
	timezoneString:		<String>

dateAndTime
	- the date and time

timezoneString
	- the time zone string

"
Class {
	#name : #RRRfc822DateTime,
	#superclass : #WAObject,
	#instVars : [
		'dateAndTime',
		'timeZoneString'
	],
	#category : 'RSS-Core-Model'
}

{ #category : #'instance creation' }
RRRfc822DateTime class >> dateAndTime: aDateAndTime timeZoneString: aString [
	^ self new
		dateAndTime: aDateAndTime;
		timeZoneString: aString;
		yourself
]

{ #category : #'instance creation' }
RRRfc822DateTime class >> newDateAndTime: aDateAndTime [
	^ self
		newDateAndTime: aDateAndTime
		offset: aDateAndTime offset
]

{ #category : #'instance creation' }
RRRfc822DateTime class >> newDateAndTime: aDateAndTime offset: aDuration [
	^ self
		dateAndTime: aDateAndTime
		timeZoneString: (self offsetString: aDuration)
]

{ #category : #'instance creation' }
RRRfc822DateTime class >> newUtc: aDateAndTime [
	^ self dateAndTime: aDateAndTime asUTC timeZoneString: 'UT'
]

{ #category : #private }
RRRfc822DateTime class >> offsetString: aDuration [
	^ String streamContents: [ :stream |
		stream nextPut: (aDuration positive ifTrue: [ $+ ] ifFalse: [ $- ]).
		stream nextPutAll: (aDuration hours abs printPaddedWith: $0 to: 2 base: 10).
		stream nextPutAll: (aDuration minutes abs printPaddedWith: $0 to: 2 base: 10) ]
]

{ #category : #accessing }
RRRfc822DateTime >> dateAndTime [
	^ dateAndTime
]

{ #category : #accessing }
RRRfc822DateTime >> dateAndTime: anObject [
	dateAndTime := anObject
]

{ #category : #printing }
RRRfc822DateTime >> encodeOn: aDocument [
	(GRPrinter rfc822WithTimeZone: self timeZoneString)
		print: self dateAndTime
		on: aDocument
]

{ #category : #printing }
RRRfc822DateTime >> printString [
	^ String streamContents: [ :stream | 
		self encodeOn: stream ]
]

{ #category : #accessing }
RRRfc822DateTime >> timeZoneString [
	^ timeZoneString
]

{ #category : #accessing }
RRRfc822DateTime >> timeZoneString: aString [
	timeZoneString := aString
]
