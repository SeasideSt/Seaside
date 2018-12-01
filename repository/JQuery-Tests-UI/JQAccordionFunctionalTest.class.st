Class {
	#name : #JQAccordionFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQAccordionFunctionalTest >> renderContentOn: html [
	html div
		script: html jQuery new accordion;
		with: [
			self berries keysAndValuesDo: [ :name :description |
				html div: [ html anchor: name ].
				html div: [ html paragraph: description ] ] ]
]

{ #category : #accessing }
JQAccordionFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQAccordionFunctionalTest >> title [
	^ 'Accordion Widget'
]

{ #category : #accessing }
JQAccordionFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Accordion'
]
