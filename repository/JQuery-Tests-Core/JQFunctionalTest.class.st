Class {
	#name : #JQFunctionalTest,
	#superclass : #WAComponent,
	#category : 'JQuery-Tests-Core-Functional'
}

{ #category : #rendering }
JQFunctionalTest >> renderReadmeOn: html [
	self url isNil ifTrue: [ ^ self ].
	html paragraph: [
		html text: 'For additional documentation and examples please visit the official '.
		html anchor
			url: self url;
			with: 'web-site'.
		html text: '.' ]
]

{ #category : #rendering }
JQFunctionalTest >> renderSeastarOn: html [
	html paragraph id: 'seastar'; with: [
		html image
			altText: 'Seaside';
			url: (JQAllFunctionalTestsLibrary urlOf: #seastarPng) ]
]

{ #category : #accessing }
JQFunctionalTest >> selectors [
	^ #()
]

{ #category : #accessing }
JQFunctionalTest >> title [
	^ self class description
]

{ #category : #accessing }
JQFunctionalTest >> url [
	^ nil
]
