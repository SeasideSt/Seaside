Class {
	#name : #WAPPathMatch,
	#superclass : #WAMatch,
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAPPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	^ (self matchClassFor: aString)
		fromString: aString index: anInteger arguments: aCollectionOfStrings
]

{ #category : #private }
WAPPathMatch class >> matchClassFor: aString [
	aString isEmpty ifTrue: [ ^ WAExactPathMatch  ].
	aString first = ${
		ifTrue: [
			| index |
			index := aString indexOf: $} startingAt: 2.
			index = aString size
				"{name}"
				ifTrue: [ ^ WAFullPlaceholderPathMatch ].
			index isZero
				"{name}suffix"
				ifFalse: [ ^ WASuffixPlaceholderPathMatch ] ].
	"prefix{name}"
	(aString last = $}
		and: [ (aString indexOf: ${) isZero not ])
			ifTrue: [ ^ WAPrefixPlaceholderPathMatch ].
	"[option1|option2]"
	(aString first = $[
		and: [ aString last = $]
		and: [ aString includes: $| ] ])
			ifTrue: [ ^ WAOrPathMatch ].
	"*name*"
	(aString first = $*
		and: [ aString last = $* ])
			ifTrue: [ ^ WAMultiPlaceholderPathMatch ].
	^ WAExactPathMatch
]

{ #category : #accessing }
WAPPathMatch >> argumentCount [
	self subclassResponsibility
]

{ #category : #public }
WAPPathMatch >> mapArgumentsWithElements: aCollection into: anArray [
	self mapArgumentsWithElements: aCollection into: anArray usingOffset: 0
]

{ #category : #public }
WAPPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	self subclassResponsibility
]

{ #category : #testing }
WAPPathMatch >> matches: aString [
	self subclassResponsibility
]

{ #category : #testing }
WAPPathMatch >> matchesJustOneElement [
	^ true
]

{ #category : #printing }
WAPPathMatch >> printOn: aStream [ 
	super printOn: aStream.
	
	aStream
		nextPutAll: ' (argumentCount: '; print: self argumentCount;
		nextPutAll: ' matchesJustOneElement: '; print: self matchesJustOneElement;
		nextPutAll: ' priority: '; print: self priority;
		nextPut: $)
]

{ #category : #accessing }
WAPPathMatch >> priority [
	self subclassResponsibility
]
