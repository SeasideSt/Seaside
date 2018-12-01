Class {
	#name : #JQDraggableFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQDraggableFunctionalTest >> renderContentOn: html [
	| top left id |
	
	html paragraph
		id: (id := html nextId);
		with: 'Drag the Seaside logo!'.
	html image
		altText: 'Seaside';
		url: (JQUiAllFunctionalTestsLibrary urlOf: #seastarPng);
		script: (html jQuery new draggable 
						opacity: 0.75;
						onStop: ((html jQuery id:  id) load 
										callbackDraggable: [ :e | top := (e at: #position) at:#top. left := (e at: #position) at:#left ];
										html: [ :r | r text: 'top:',top greaseString,'px left:',left greaseString,'px' ] ))
]

{ #category : #accessing }
JQDraggableFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQDraggableFunctionalTest >> title [
	^ 'Draggable Interaction'
]

{ #category : #accessing }
JQDraggableFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Draggable'
]
