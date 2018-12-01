Class {
	#name : #WAMultiPlaceholderPathMatch,
	#superclass : #WAPlaceholderPathMatch,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAMultiPlaceholderPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	^ self
		source: anInteger
		target: (self
			targetIndexOf: (aString copyFrom: 2 to: aString size - 1)
			arguments: aCollectionOfStrings)
]

{ #category : #'instance creation' }
WAMultiPlaceholderPathMatch class >> source: anFirstInteger target: aSecondInteger [
	^ self basicNew initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger
]

{ #category : #public }
WAMultiPlaceholderPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	anArray
		at: targetIndex
		put: (aCollection copyFrom: sourceIndex to: sourceIndex + anInteger)
]

{ #category : #testing }
WAMultiPlaceholderPathMatch >> matches: aString [
	^ true
]

{ #category : #testing }
WAMultiPlaceholderPathMatch >> matchesJustOneElement [
	^ false
]

{ #category : #accessing }
WAMultiPlaceholderPathMatch >> priority [
	^ 1
]
