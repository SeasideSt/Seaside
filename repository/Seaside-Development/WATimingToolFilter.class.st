Class {
	#name : #WATimingToolFilter,
	#superclass : #WARequestFilter,
	#instVars : [
		'startTime',
		'previousTiming'
	],
	#category : 'Seaside-Development-Filter'
}

{ #category : #accessing }
WATimingToolFilter >> currentTiming [
	"Answer the running timing, or 0 if no value is available."

	^ startTime isNil ifTrue: [ 0 ] ifFalse: [ Time millisecondsSince: startTime ]
]

{ #category : #processing }
WATimingToolFilter >> handleFiltered: aRequestContext [
	startTime := Time millisecondClockValue.
	[ super handleFiltered: aRequestContext ]
		ensure: [ previousTiming := self currentTiming ]
]

{ #category : #accessing }
WATimingToolFilter >> previousTiming [
	"Answer the previous timing, or 0 if no value is available."

	^ previousTiming ifNil: [ 0 ]
]
