"
WADateTimeSelector allows the user to select a date and time in a given range dropdown menus (html select). Actual work done by WADateSelector and WATimeSelector. Date range is default range of WADateSelector.

See WADateSelectorFunctionalTest for sample of usage.
Select ""Date Selector"" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	dateSelector	<WADateSelector>	presents date selection to user
	timeSelector	<WATimeSelector>	presents time selection to user


"
Class {
	#name : #WADateTimeSelector,
	#superclass : #WACanvasWidget,
	#instVars : [
		'dateSelector',
		'timeSelector'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #hooks }
WADateTimeSelector >> children [

	^ Array with: dateSelector with: timeSelector
]

{ #category : #accessing }
WADateTimeSelector >> dateAndTime [

	^ DateAndTime date: dateSelector date time: timeSelector time
]

{ #category : #accessing }
WADateTimeSelector >> dateAndTime: anObject [

	dateSelector date: anObject asDate.
	timeSelector time: anObject asTime
]

{ #category : #initialization }
WADateTimeSelector >> initialize [
	super initialize.
	dateSelector := WADateSelector new.
	timeSelector := WATimeSelector new
]

{ #category : #rendering }
WADateTimeSelector >> renderContentOn: html [
	html span: dateSelector.
	html span: [ html strong: ' : ' ].
	html span: timeSelector
]
