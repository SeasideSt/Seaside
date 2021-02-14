Class {
	#name : #WADelayFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #actions }
WADelayFunctionalTest >> go [
	self show: (WAComponent new
		addMessage: '3 seconds';
		addDecoration: (WADelayedAnswerDecoration new delay: 3);
		yourself)
]

{ #category : #rendering }
WADelayFunctionalTest >> renderContentOn: html [
	html paragraph: 'Clicking the following anchor should replace it with the message "3 seconds" for 3 seconds and then restore it.'.
	html paragraph: [
		html anchor
			callback: [ self go ];
			with: 'Start' ]
]
