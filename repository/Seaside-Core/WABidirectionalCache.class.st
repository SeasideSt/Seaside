"
I support key -> value and value -> key mappings and never forget anything.

I also implement serveral methods of Dictionary.
"
Class {
	#name : #WABidirectionalCache,
	#superclass : #WACache,
	#instVars : [
		'byKey',
		'byValue'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #accessing }
WABidirectionalCache >> at: aKey [
	^ byKey at: aKey
]

{ #category : #accessing }
WABidirectionalCache >> at: aKey ifAbsent: aBlock [
	^ byKey at: aKey ifAbsent: aBlock
]

{ #category : #putting }
WABidirectionalCache >> at: aKey put: anObject [
	byValue at: anObject ifPresent: [ :key |
		key = aKey ifFalse: [
			self errorAlreadyMapped ] ].
	byKey at: aKey ifPresent: [ :value |
		byValue removeKey: value ].
	byKey at: aKey put: anObject.
	byValue at: anObject put: aKey.
	^ anObject
]

{ #category : #public }
WABidirectionalCache >> clear [
	byKey removeAll.
	byValue removeAll
]

{ #category : #enumerating }
WABidirectionalCache >> do: aBlock [
	byKey do: aBlock
]

{ #category : #private }
WABidirectionalCache >> errorAlreadyMapped [
	self error: 'Already mapped'
]

{ #category : #testing }
WABidirectionalCache >> includes: anObject [
	^ byValue includesKey: anObject
]

{ #category : #private }
WABidirectionalCache >> includesKey: key [
	^ byKey includesKey: key
]

{ #category : #initialization }
WABidirectionalCache >> initialize [
	super initialize.
	byKey := Dictionary new.
	byValue := Dictionary new
]

{ #category : #accessing }
WABidirectionalCache >> keyAtValue: anObject ifAbsent: aBlock [
	^ byValue at: anObject ifAbsent: aBlock
]

{ #category : #accessing }
WABidirectionalCache >> keys [
	^ byKey keys
]

{ #category : #enumerating }
WABidirectionalCache >> keysAndValuesDo: aTwoArgumentBlock [
	byKey keysAndValuesDo: aTwoArgumentBlock
]

{ #category : #copying }
WABidirectionalCache >> postCopy [
	super postCopy.
	byKey := byKey copy.
	byValue := byValue copy
]

{ #category : #removing }
WABidirectionalCache >> remove: anObject [
	| key |
	key := byValue removeKey: anObject.
	byKey removeKey: key
]

{ #category : #removing }
WABidirectionalCache >> removeKey: aKey ifAbsent: aBlock [
	| value |
	value := byKey at: aKey ifAbsent: [ ^ aBlock value ].
	byKey removeKey: aKey.
	byValue removeKey: value.
	^ value
	
]

{ #category : #accessing }
WABidirectionalCache >> size [
	^ byKey size
]

{ #category : #putting }
WABidirectionalCache >> store: anObject [
	| candidateKey |
	[ 
		candidateKey := WAKeyGenerator current keyOfLength: self keySize.
		self includesKey: candidateKey ] whileTrue.
	self at: candidateKey put: anObject.
	^ candidateKey
]

{ #category : #public }
WABidirectionalCache >> valuesCollect: aBlock [
	| result |
	result := self species new.
	self keysAndValuesDo: [ :key :value |
		result at: key put: (aBlock value: value) ].
	^ result
]
