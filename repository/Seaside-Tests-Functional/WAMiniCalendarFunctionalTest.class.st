Class {
	#name : #WAMiniCalendarFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'calendar'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WAMiniCalendarFunctionalTest >> children [
	^ Array with: calendar
]

{ #category : #initialization }
WAMiniCalendarFunctionalTest >> initialize [
	super initialize.
	calendar := WAMiniCalendar new
]

{ #category : #rendering }
WAMiniCalendarFunctionalTest >> renderContentOn: html [
	html render: calendar.

	html div: [
		html strong: 'selected:'.
		html space.
		html render: calendar date ]
]
