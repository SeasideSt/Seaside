Class {
	#name : #WAFullPlaceholderPathMatch,
	#superclass : #WAPlaceholderPathMatch,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAFullPlaceholderPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: 2 to: aString size - 1)
			arguments: aCollectionOfStrings)
]

{ #category : #'instance creation' }
WAFullPlaceholderPathMatch class >> source: anFirstInteger target: aSecondInteger [
	^ self basicNew initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger
]

{ #category : #public }
WAFullPlaceholderPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	anArray
		at: targetIndex
		put: (aCollection at: sourceIndex + anInteger)
]

{ #category : #testing }
WAFullPlaceholderPathMatch >> matches: aString [
	^ true
]

{ #category : #accessing }
WAFullPlaceholderPathMatch >> priority [
	^ 2
]
