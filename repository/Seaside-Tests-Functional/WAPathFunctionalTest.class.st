Class {
	#name : #WAPathFunctionalTest,
	#superclass : #WAFunctionalTest,
	#instVars : [
		'string'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAPathFunctionalTest >> renderContentOn: html [
	string notNil ifTrue: [ html anchor name: string ].
	
	html paragraph: 'Whatever you submit below should be added to the URL both as a path element and a fragment (the part after #).'.
	html form: [
		html div: [
			html textInput on: #string of: self.
			html submitButton ] ]
]

{ #category : #accessing }
WAPathFunctionalTest >> string [
	^ string
]

{ #category : #accessing }
WAPathFunctionalTest >> string: anObject [
	string := anObject
]

{ #category : #updating }
WAPathFunctionalTest >> updateUrl: aUrl [
	super updateUrl: aUrl.
	string isNil ifTrue: [ ^ self ].
	aUrl addToPath: string.
	aUrl fragment: string
]
