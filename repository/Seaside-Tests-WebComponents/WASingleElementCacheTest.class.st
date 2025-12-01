Class {
	#name : 'WASingleElementCacheTest',
	#superclass : 'WACacheTest',
	#category : 'Seaside-Tests-WebComponents',
	#package : 'Seaside-Tests-WebComponents'
}

{ #category : 'private' }
WASingleElementCacheTest >> createCache [
	^ WASingleElementCache new
]

{ #category : 'testing' }
WASingleElementCacheTest >> testClear [
	cache at: 1 put: 'one'.
	cache clear.
	self assert: (cache at: 1 ifAbsent: [ 'two' ]) equals: 'two'.
]

{ #category : 'testing' }
WASingleElementCacheTest >> testKeyAtValue [
	cache at: 1 put: 'one'.
	self assert: (cache keyAtValue: 'one' ifAbsent: [ 2 ]) equals: 1.
	self assert: (cache keyAtValue: 'two' ifAbsent: [ 2 ]) equals: 2.
]

{ #category : 'testing' }
WASingleElementCacheTest >> testKeysAndValuesDo [
	| reference readBack |
	reference := Dictionary new.

	cache at: 1 put: 'one'.
	reference at: 1 put: 'one'.
	
	readBack := Dictionary new.
	cache keysAndValuesDo: [ :key :value |
		readBack at: key put: value ].
	
	self assert: readBack equals: reference
]

{ #category : 'testing' }
WASingleElementCacheTest >> testSize [
	self assert: cache size equals: 0.
	cache at: 1 put: 'one'.
	self assert: cache size equals: 1.
	cache at: 2 put: 'two'.
	self assert: cache size equals: 1.
]

{ #category : 'testing' }
WASingleElementCacheTest >> testStore [
	| generator |
	generator := WAPrecomputedKeyGenerator keys: #(1 2 3).
	WAKeyGenerator
		use: generator
		during: [
			self assert: (cache store: 'key1') equals: 1.
			self assert: (cache store: 'key2') equals: 2.
			self assert: (cache store: 'key3') equals: 3 ]
]
