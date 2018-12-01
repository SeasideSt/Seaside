Class {
	#name : #RRRfc822DateTimeTest,
	#superclass : #TestCase,
	#category : 'RSS-Tests-Core'
}

{ #category : #private }
RRRfc822DateTimeTest >> render: anObject [
	^ RRRssRenderCanvas builder render: anObject
]

{ #category : #tests }
RRRfc822DateTimeTest >> testNewDateAndTime [
	| date emailDate |
	date := DateAndTime year: 2008 month: 8 day: 1 hour: 9 minute: 4 second: 4 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	emailDate := RRRfc822DateTime newDateAndTime: date.
	self assert: 'Fri, 01 Aug 2008 09:04:04 +0200' = (self render: emailDate)
]

{ #category : #tests }
RRRfc822DateTimeTest >> testNewDateAndTimeTimezoneString [
	| date emailDate |
	date := DateAndTime year: 2008 month: 8 day: 31 hour: 19 minute: 14 second: 24 offset: Duration zero.
	emailDate := RRRfc822DateTime
		newDateAndTime: date
		offset: (Duration days: 0 hours: -2 minutes: 0 seconds: 0).
	self assert: 'Sun, 31 Aug 2008 19:14:24 -0200' = (self render: emailDate)
]

{ #category : #tests }
RRRfc822DateTimeTest >> testNewDateAndTimeUtc [
	| date emailDate |
	date := DateAndTime year: 2008 month: 8 day: 31 hour: 19 minute: 14 second: 24 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	emailDate := RRRfc822DateTime newUtc: date.
	self assert: 'Sun, 31 Aug 2008 17:14:24 UT' = (self render: emailDate)
]

{ #category : #tests }
RRRfc822DateTimeTest >> testOffsetString [
	| duration formatted |
	duration := Duration days: 0 hours: 2 minutes: 3 seconds: 0.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '+0203' = formatted.
	
	duration := Duration days: 0 hours: -2 minutes: 0 seconds: 0.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '-0200' = formatted.
	
	duration := Duration days: 0 hours: 0 minutes: -3 seconds: 0.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '-0003' = formatted.
	
	"Test that 0 offset is positive and #offsetString: sends only ANSI messages."
	duration:= Duration zero.
	formatted := RRRfc822DateTime offsetString: duration.
	self assert: '+0000' = formatted
]
