Class {
	#name : #WAUrlDecodingFunctionalTest,
	#superclass : #WAFunctionalTest,
	#category : 'Seaside-Tests-Functional'
}

{ #category : #rendering }
WAUrlDecodingFunctionalTest >> renderContentOn: html [
	| anchor |
	self renderExplanationOn: html.

	anchor := html anchor.
	anchor url rawAddToPath: self testPath.
	anchor
		callback: [ self runTest ];
		with: 'Run Test'
]

{ #category : #rendering }
WAUrlDecodingFunctionalTest >> renderExplanationOn: html [
	html paragraph: 'This tests whether url encoding works. Just click on "Run Test"'.
]

{ #category : #actions }
WAUrlDecodingFunctionalTest >> runTest [
	| success |
	success := self requestContext request url path last = self testPath.
	success
		ifTrue: [ self inform: 'Success!' onAnswer: [ "ignore" ] ]
		ifFalse: [ self inform: 'Failed!' onAnswer: [ "ignore" ] ].
]

{ #category : #private }
WAUrlDecodingFunctionalTest >> testPath [
	"answers 'tests/functional/WAUrlDecodingFunctionalTest'"
	| url path |
	url := self requestContext request url.
	"this method is also called in #runTest where the path is already added, we don't want this"
	path := url path first: (self application url path size + 1).
	^ String streamContents: [ :stream |
		path
			do: [ :each  | stream nextPutAll: each ]
			 separatedBy: [ stream nextPut: $/ ] ]
]
