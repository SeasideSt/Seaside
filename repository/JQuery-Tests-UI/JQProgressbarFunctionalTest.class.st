Class {
	#name : #JQProgressbarFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQProgressbarFunctionalTest >> renderContentOn: html [
	html div script: (html jQuery new progressbar value: 35)
]

{ #category : #accessing }
JQProgressbarFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQProgressbarFunctionalTest >> title [
	^ 'Progressbar Widget'
]

{ #category : #accessing }
JQProgressbarFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Progressbar'
]
