Class {
	#name : #WAExactPathMatch,
	#superclass : #WAPPathMatch,
	#instVars : [
		'element'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAExactPathMatch class >> fromString: aString [
	^ self basicNew inititializeWith: aString
]

{ #category : #'instance creation' }
WAExactPathMatch class >> fromString: aString index: anInteger arguments: aCollectionOfStrings [
	^ self fromString: aString
]

{ #category : #accessing }
WAExactPathMatch >> argumentCount [
	^ 0
]

{ #category : #initialization }
WAExactPathMatch >> inititializeWith: aString [
	self initialize.
	element := aString
]

{ #category : #public }
WAExactPathMatch >> mapArgumentsWithElements: aCollection into: anArray usingOffset: anInteger [
	"ignore"
]

{ #category : #testing }
WAExactPathMatch >> matches: aString [
	^ element = aString
]

{ #category : #accessing }
WAExactPathMatch >> priority [
	^ 3
]
