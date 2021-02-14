"
Takes an arbitrary number of CSS selectors (strings) and returns a document-order array of extended DOM elements that match any of them.
"
Class {
	#name : #PTSelector,
	#superclass : #PTEnumerable,
	#instVars : [
		'selectors'
	],
	#category : 'Prototype-Core-Elements'
}

{ #category : #adding }
PTSelector >> add: aString [
	"Add the selector aString to the receiver."

	selectors add: aString
]

{ #category : #initialization }
PTSelector >> initialize [
	super initialize.
	selectors := OrderedCollection new
]

{ #category : #printing }
PTSelector >> javascriptContentOn: aStream [
	aStream nextPutAll: '$$'.
	JSStream encodeArguments: self selectors on: aStream
]

{ #category : #accessing }
PTSelector >> selectors [
	^ selectors
]

{ #category : #accessing }
PTSelector >> selectors: aCollection [
	selectors := aCollection
]
