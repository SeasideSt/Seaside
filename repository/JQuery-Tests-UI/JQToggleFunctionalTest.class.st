Class {
	#name : #JQToggleFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQToggleFunctionalTest >> renderContentOn: html [
	html paragraph class: 'actions'; with: [
		#( blind clip drop explode fade fold puff scale slide ) do: [ :each | 
			html anchor
				onClick: ((html jQuery: '.box') effect
					toggle;
					perform: each);
				with: each ] ].
	self renderBoxOn: html
]

{ #category : #accessing }
JQToggleFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #accessing }
JQToggleFunctionalTest >> title [
	^ 'Toggle Effects'
]

{ #category : #accessing }
JQToggleFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Effects'
]
