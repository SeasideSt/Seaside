Class {
	#name : #WAPrecomputedKeyGenerator,
	#superclass : #WAKeyGenerator,
	#instVars : [
		'keys',
		'current'
	],
	#category : 'Seaside-Tests-Core-Cache'
}

{ #category : #'instance creation' }
WAPrecomputedKeyGenerator class >> from: start to: end [
	^ self keys: (start to: end) asArray
]

{ #category : #'instance creation' }
WAPrecomputedKeyGenerator class >> keys: aSequenceableCollection [
	^ self basicNew
		initializeWithKeys: aSequenceableCollection
]

{ #category : #initialization }
WAPrecomputedKeyGenerator >> initializeWithKeys: aSequenceableCollection [
	self initialize.
	keys := aSequenceableCollection.
	current := 1
]

{ #category : #public }
WAPrecomputedKeyGenerator >> keyOfLength: anInteger [
	| key |
	key := keys at: current.
	current := current + 1.
	^ key
]
