Class {
	#name : #WAPrefixPlaceholderPathMatch,
	#superclass : #WAPlaceholderPathMatch,
	#instVars : [
		'prefix'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAPrefixPlaceholderPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	| prefix |
	prefix := aString copyUpTo: ${.
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: prefix size + 2 to: aString size - 1)
			arguments: aCollectionOfStrings)
		prefix: prefix
]

{ #category : #'instance creation' }
WAPrefixPlaceholderPathMatch class >> source: anFirstInteger target: aSecondInteger prefix: aString [
	^ self basicNew
		initializeWithSourceIndex: anFirstInteger
		targetIndex: aSecondInteger
		prefix: aString
]

{ #category : #initialization }
WAPrefixPlaceholderPathMatch >> initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger prefix: aString [
	self initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger.
	prefix := aString
]

{ #category : #public }
WAPrefixPlaceholderPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	| value |
	value := aCollection at: sourceIndex + anInteger.
	anArray
		at: targetIndex
		put: (value copyFrom: prefix size + 1 to: value size)
]

{ #category : #testing }
WAPrefixPlaceholderPathMatch >> matches: aString [
	^ (aString size > prefix size)
		and: [ aString beginsWithSubCollection: prefix ]
]

{ #category : #accessing }
WAPrefixPlaceholderPathMatch >> priority [
	^ 3
]
