Class {
	#name : #JQResizableFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'size'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQResizableFunctionalTest >> initialize [
	super initialize.
	size := 128 @ 128
]

{ #category : #rendering }
JQResizableFunctionalTest >> renderContentOn: html [
	html image
		altText: 'Seaside';
		width: size x; height: size y;
		url: (JQUiAllFunctionalTestsLibrary urlOf: #seastarPng);
		script: (html jQuery new resizable
			onStop: (html jQuery ajax
				callbackResizable: [ :event | size := event at: #size ]))
]

{ #category : #accessing }
JQResizableFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQResizableFunctionalTest >> title [
	^ 'Resizable Interaction'
]

{ #category : #accessing }
JQResizableFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Resizable'
]
