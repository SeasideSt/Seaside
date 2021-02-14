Class {
	#name : #WASortedAccepts,
	#superclass : #WAObject,
	#instVars : [
		'accepts'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WASortedAccepts class >> accepts: aCollectionOfAccepts [
	^ self basicNew initializeWithAccepts: aCollectionOfAccepts
]

{ #category : #initialization }
WASortedAccepts >> acceptsDo: aOneArgumentBlock [
	| sortedKeys |
	sortedKeys := accepts keys sorted: [ :a :b | a > b ].
	sortedKeys do: [ :each |
		aOneArgumentBlock value: (accepts allAt: each) ]
]

{ #category : #initialization }
WASortedAccepts >> initializeWithAccepts: aCollectionOfAccepts [
	self initialize.
	accepts := GROrderedMultiMap2 new.
	aCollectionOfAccepts isNil ifFalse: [
		aCollectionOfAccepts do: [ :each |
			accepts at: each quality add: each value ] ]
]

{ #category : #testing }
WASortedAccepts >> isEmpty [
	^ accepts isEmpty
]
