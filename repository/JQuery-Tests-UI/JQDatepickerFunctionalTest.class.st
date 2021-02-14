Class {
	#name : #JQDatepickerFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'date'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQDatepickerFunctionalTest >> initialize [
	super initialize.
	date := '09/19/2008'
]

{ #category : #rendering }
JQDatepickerFunctionalTest >> renderContentOn: html [	
	html textInput
		value: date;
		callback: [ :value | date := value ];
		script: (html jQuery new datepicker
			onSelect: (html jQuery ajax serializeThis))
]

{ #category : #accessing }
JQDatepickerFunctionalTest >> selectors [
	^ #(initialize renderContentOn:)
]

{ #category : #accessing }
JQDatepickerFunctionalTest >> title [
	^ 'Datepicker Widget'
]

{ #category : #accessing }
JQDatepickerFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Datepicker'
]
