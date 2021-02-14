Class {
	#name : #WAWelcomeExample,
	#superclass : #WAComponent,
	#category : 'Seaside-Welcome'
}

{ #category : #rendering }
WAWelcomeExample >> renderContentOn: html [
	html heading level1 with: 'Example: ', self title.
	html anchor
		class: 'goback';
		callback: [ self answer ];
		with: '[ go back ]'.
	self renderExampleOn: html.
		
	html div
		class: 'buttons';
		with: [
			html anchor
				callback: [ self answer ];
				script: (html jQuery this button
					primaryIcon: 'ui-icon-arrowreturnthick-1-w');
				title: 'Go back';
				with: 'Back' ]
]

{ #category : #rendering }
WAWelcomeExample >> renderExampleOn: html [
	self subclassResponsibility
]

{ #category : #private }
WAWelcomeExample >> title [
	self subclassResponsibility
]
