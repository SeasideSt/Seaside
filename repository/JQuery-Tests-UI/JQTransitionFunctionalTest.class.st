Class {
	#name : #JQTransitionFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #rendering }
JQTransitionFunctionalTest >> renderContentOn: html [
	html paragraph class: 'actions'; with: [
		#( green wide bold ) do: [ :each |
			html anchor
				onClick: ((html jQuery: '.box')
					toggleClass: each
					duration: 'slow');
				with: (each copyUpTo: $:) ] ].
	self renderBoxOn: html
]

{ #category : #accessing }
JQTransitionFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #hooks }
JQTransitionFunctionalTest >> style [
	^ '.wide { width: 100%; height: 50px; }
.bold { border-width: 5px; }'
]

{ #category : #accessing }
JQTransitionFunctionalTest >> title [
	^ 'Class Transition'
]

{ #category : #accessing }
JQTransitionFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Effects/ClassTransitions'
]
