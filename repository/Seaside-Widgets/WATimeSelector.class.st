"
WATimeSelector displays dropdown menus (html select) allowing a user to delect a time within a range. ""startHour"" and ""endHour"" define the range of selectable times. Time is displayed in 24 hour format. WATimeSelector>>time returns time user selected as a Time object.

See WADateSelectorFunctionalTest for sample of usage.
Select ""Date Selector"" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	endHour	<Integer 0-23>	end of time interval for selectable times
	hour	<Integer 0-23>	selected hour
	minute	<Integer 0-59>	selected minute
	second	<Integer 0-59>	selected second
	startHour	<Integer 0-23>	start of time interval for selectable times

"
Class {
	#name : #WATimeSelector,
	#superclass : #WACanvasWidget,
	#instVars : [
		'second',
		'hour',
		'minute',
		'startHour',
		'endHour'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #accessing }
WATimeSelector >> date: aDate [
	second := aDate dayOfMonth.
	hour := aDate monthIndex.
	minute := aDate year
]

{ #category : #accessing }
WATimeSelector >> days [
	^ 1 to: 31
]

{ #category : #accessing }
WATimeSelector >> endHour [
	^ endHour
]

{ #category : #accessing }
WATimeSelector >> endHour: anInteger [
	endHour := anInteger
]

{ #category : #accessing }
WATimeSelector >> hour [
	^ hour
]

{ #category : #accessing }
WATimeSelector >> hour: anObject [
	hour := anObject
]

{ #category : #initialization }
WATimeSelector >> initialize [
	super initialize.
	startHour := 0.
	endHour := 23.
	self time: Time midnight
]

{ #category : #accessing }
WATimeSelector >> minute [
	^ minute
]

{ #category : #accessing }
WATimeSelector >> minute: anObject [
	minute := anObject
]

{ #category : #private }
WATimeSelector >> privateIsValidSecond: theSecond hourNumber: theHour minuteNumber: theMinute [

	^ (theHour between: 0 and: 23)
		and: [ (theMinute between: 0 and: 59)
		and: [ theSecond between: 0 and: 59 ] ]
]

{ #category : #rendering }
WATimeSelector >> renderContentOn: html [
	html select
		list: (0 to: 23);
		on: #hour of: self.
	html select
		list: (0 to: 59);
		on: #minute of: self.
	html select
		list: (0 to: 59);
		on: #second of: self.
	self timeIsValid
		ifFalse: [ self renderValidationErrorOn: html ]
]

{ #category : #rendering }
WATimeSelector >> renderValidationErrorOn: html [
	html span
		class: 'error';
		with: 'invalid time'
]

{ #category : #accessing }
WATimeSelector >> second [
	^ second
]

{ #category : #accessing }
WATimeSelector >> second: anObject [
	second := anObject
]

{ #category : #accessing }
WATimeSelector >> startHour [
	^ startHour
]

{ #category : #accessing }
WATimeSelector >> startHour: anInteger [
	startHour := anInteger
]

{ #category : #accessing }
WATimeSelector >> time [
	(self privateIsValidSecond: second hourNumber: hour minuteNumber: minute)
		ifFalse: [ self error: 'Invalid time' ].
	^ self timeClass hour: hour minute: minute second: second
]

{ #category : #accessing }
WATimeSelector >> time: aTime [
	second := aTime second.
	hour := aTime hour.
	minute := aTime minute
]

{ #category : #private }
WATimeSelector >> timeClass [
	^ Time
]

{ #category : #testing }
WATimeSelector >> timeIsValid [
	[ self time ] on: Error do: [ :e | ^ false ].
	^ true
]
