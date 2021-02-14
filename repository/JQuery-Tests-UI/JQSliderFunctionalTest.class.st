Class {
	#name : #JQSliderFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'current'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQSliderFunctionalTest >> initialize [
	super initialize.
	current := 50
]

{ #category : #rendering }
JQSliderFunctionalTest >> renderContentOn: html [
	html div script: (html jQuery new slider
		value: current;
		onStop: (html jQuery ajax
			callback: [ :value | current := value asNumber ]
			value: (html jQuery this slider getValue)))
]

{ #category : #accessing }
JQSliderFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQSliderFunctionalTest >> title [
	^ 'Slider Widget'
]

{ #category : #accessing }
JQSliderFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Slider'
]
