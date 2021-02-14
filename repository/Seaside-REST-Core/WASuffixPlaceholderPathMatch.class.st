Class {
	#name : #WASuffixPlaceholderPathMatch,
	#superclass : #WAPlaceholderPathMatch,
	#instVars : [
		'suffix'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WASuffixPlaceholderPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	| suffix |
	suffix := aString copyAfter: $}.
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: 2 to: aString size - suffix size - 1)
			arguments: aCollectionOfStrings)
		suffix: suffix
]

{ #category : #'instance creation' }
WASuffixPlaceholderPathMatch class >> source: anFirstInteger target: aSecondInteger suffix: aString [
	^ self basicNew
		initializeWithSourceIndex: anFirstInteger
		targetIndex: aSecondInteger
		suffix: aString
]

{ #category : #initialization }
WASuffixPlaceholderPathMatch >> initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger suffix: aString [
	self initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger.
	suffix := aString
]

{ #category : #public }
WASuffixPlaceholderPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	| value |
	value := aCollection at: sourceIndex + anInteger.
	anArray
		at: targetIndex
		put: (value copyFrom: 1 to: value size - suffix size)
]

{ #category : #testing }
WASuffixPlaceholderPathMatch >> matches: aString [
	^ (aString size > suffix size)
		and: [ aString endsWithSubCollection: suffix ]
]

{ #category : #accessing }
WASuffixPlaceholderPathMatch >> priority [
	^ 3
]
