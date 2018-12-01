"
WADateSelector displays dropdown menus (html select) allowing a user to delect a date within a range. ""startYear"" and ""endYear"" define the range of selectable dates. Date displayed in month, day, year format. WADateSelector>>date returns date user selected as a Date object.

See WADateSelectorFunctionalTest for sample of usage.
Select ""Date Selector"" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	day	<Integer 1-31> selected day
	endYear	<Integer>	end of range of dates user is allowed to select, not required to use 4 digits
	month	<Integer 1-12>	selected month
	startYear	<Integer>	 start of range of dates user is allowed to select, not required to use 4 digits
	year	<Integer>	selected year


"
Class {
	#name : #WADateSelector,
	#superclass : #WACanvasWidget,
	#instVars : [
		'day',
		'month',
		'year',
		'startYear',
		'endYear'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #accessing }
WADateSelector >> date [
	(self privateIsValidDay: day monthNumber: month year: year)
		ifFalse: [ self error: 'Invalid date' ].
	^ self dateClass year: year month: month day: day
]

{ #category : #accessing }
WADateSelector >> date: aDate [
	day := aDate dayOfMonth.
	month := aDate monthIndex.
	year := aDate year
]

{ #category : #private }
WADateSelector >> dateClass [
	^ Date
]

{ #category : #testing }
WADateSelector >> dateIsValid [
	[ self date ] on: Error do: [ :e | ^ false ].
	^ true
]

{ #category : #accessing }
WADateSelector >> day [
	^ day
]

{ #category : #accessing }
WADateSelector >> day: anObject [
	day := anObject
]

{ #category : #accessing }
WADateSelector >> days [
	^ 1 to: 31
]

{ #category : #accessing }
WADateSelector >> endYear [
	^ endYear
]

{ #category : #accessing }
WADateSelector >> endYear: anInteger [
	endYear := anInteger
]

{ #category : #initialization }
WADateSelector >> initialize [
	super initialize.
	startYear := Date today year - 1.
	endYear := Date today year + 5.
	self date: self dateClass today
]

{ #category : #accessing }
WADateSelector >> labelForDay: aNumber [
	^ aNumber
]

{ #category : #accessing }
WADateSelector >> labelForMonth: aNumber [
	^ Date nameOfMonth: aNumber
]

{ #category : #accessing }
WADateSelector >> labelForYear: aNumber [
	^ aNumber
]

{ #category : #accessing }
WADateSelector >> month [
	^ month
]

{ #category : #accessing }
WADateSelector >> month: anObject [
	month := anObject
]

{ #category : #accessing }
WADateSelector >> months [
	^ 1 to: 12
]

{ #category : #private }
WADateSelector >> privateIsValidDay: theDay monthNumber: theMonth year: theYear [
	| daysInMonth |
	(theMonth between: 1 and: 12)
		ifFalse: [ ^ false ].
	daysInMonth := Date daysInMonth: (Date nameOfMonth: theMonth) forYear: theYear.
	^ theDay between: 1 and: daysInMonth
]

{ #category : #rendering }
WADateSelector >> renderContentOn: html [
	html select
		list: self months;
		on: #month of: self;
		labels: [ :each | self labelForMonth: each ].

	html select
		list: self days;
		on: #day of: self;
		labels: [ :each | self labelForDay: each ].

	html select
		list: self yearRange;
		on: #year of: self;
		labels: [ :each | self labelForYear: each ].

	self dateIsValid ifFalse: [ self renderValidationErrorOn: html ]
]

{ #category : #rendering }
WADateSelector >> renderValidationErrorOn: html [
	html span
		class: 'error';
		with: 'invalid date'
]

{ #category : #accessing }
WADateSelector >> startYear [
	^ startYear
]

{ #category : #accessing }
WADateSelector >> startYear: anInteger [
	startYear := anInteger
]

{ #category : #accessing }
WADateSelector >> year [
	^ year
]

{ #category : #accessing }
WADateSelector >> year: anObject [
	year := anObject
]

{ #category : #accessing }
WADateSelector >> yearRange [
	^ self startYear to: self endYear
]
