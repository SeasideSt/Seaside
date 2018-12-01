"
I support only key -> value mappings and never forget anything.
"
Class {
	#name : #WAUnidirectionalCache,
	#superclass : #WACache,
	#instVars : [
		'dictionary'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #accessing }
WAUnidirectionalCache >> at: aKey ifAbsent: aBlock [
	^ dictionary at: aKey ifAbsent: aBlock
]

{ #category : #putting }
WAUnidirectionalCache >> at: aKey put: anObject [
	^ dictionary at: aKey put: anObject
]

{ #category : #public }
WAUnidirectionalCache >> clear [
	dictionary removeAll
]

{ #category : #private }
WAUnidirectionalCache >> errorAlreadyMapped [
	self error: 'Already mapped'
]

{ #category : #initialization }
WAUnidirectionalCache >> initialize [
	super initialize.
	dictionary := Dictionary new
]

{ #category : #accessing }
WAUnidirectionalCache >> keyAtValue: anObject ifAbsent: aBlock [
	self shouldNotImplement
]

{ #category : #enumerating }
WAUnidirectionalCache >> keysAndValuesDo: aTwoArgumentBlock [
	dictionary keysAndValuesDo: aTwoArgumentBlock
]

{ #category : #copying }
WAUnidirectionalCache >> postCopy [
	super postCopy.
	dictionary := dictionary copy
]

{ #category : #removing }
WAUnidirectionalCache >> remove: anObject [
	self shouldNotImplement
]

{ #category : #accessing }
WAUnidirectionalCache >> size [
	^ dictionary size
]

{ #category : #putting }
WAUnidirectionalCache >> store: anObject [
	| candidateKey |
	[ 
		| written |
		written := false.
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		dictionary at: candidateKey ifAbsentPut: [ written := true. anObject ].
		written ] whileFalse.
	^ candidateKey
]
