Class {
	#name : #WAOrPathMatch,
	#superclass : #WAPPathMatch,
	#instVars : [
		'elements'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAOrPathMatch class >> fromString: aString [
	^ self basicNew inititializeWith: aString
]

{ #category : #'instance creation' }
WAOrPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	^ self fromString: aString
]

{ #category : #accessing }
WAOrPathMatch >> argumentCount [
	^ 0
]

{ #category : #initialization }
WAOrPathMatch >> inititializeWith: aString [
	self initialize.
	elements := GRPlatform subStringsIn: aString splitBy: $|.
	"cut off leading $[ from first"
	elements at: 1 put: (elements first allButFirst).
	"cut off trailing $] from first"
	elements at: elements size put: (elements last allButLast)
]

{ #category : #public }
WAOrPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	"ignore"
]

{ #category : #testing }
WAOrPathMatch >> matches: aString [
	^ elements includes: aString
]

{ #category : #accessing }
WAOrPathMatch >> priority [
	^ 3
]
