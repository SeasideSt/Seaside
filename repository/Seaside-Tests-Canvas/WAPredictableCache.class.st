"
A WAPredictableCache is a WACache that uses incrementing numbers as cache keys. This way the keys are predictable. This is useful for tests.

"
Class {
	#name : #WAPredictableCache,
	#superclass : #WABidirectionalCache,
	#instVars : [
		'nextKey'
	],
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #initialization }
WAPredictableCache >> initialize [
	super initialize.
	nextKey := 1
]

{ #category : #public }
WAPredictableCache >> store: anObject [
	"Store anObject in the cache, generating a new random key. Return the key."
	
	| key |
	key := nextKey greaseString.
	nextKey := nextKey + 1.
	self at: key put: anObject.
	
	^ key
]
