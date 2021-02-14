Class {
	#name : #WACacheTest,
	#superclass : #TestCase,
	#instVars : [
		'cache'
	],
	#category : 'Seaside-Tests-Core-Cache'
}

{ #category : #testing }
WACacheTest class >> isAbstract [
	^ self name = #WACacheTest
]

{ #category : #private }
WACacheTest >> createCache [
	self subclassResponsibility
]

{ #category : #running }
WACacheTest >> setUp [
	cache := self createCache
]

{ #category : #testing }
WACacheTest >> testAtPut [
	1 to: 100 do: [ :i |
		| absent mapped |
		absent := false.
		cache at: i ifAbsent: [ absent := true ].
		self assert: absent.
		mapped := cache at: i put: i greaseString.
		self assert: mapped = i greaseString.
		mapped := cache at: i ifAbsent: [ self assert: false ].
		self assert: mapped = i greaseString ]
]

{ #category : #testing }
WACacheTest >> testAtPutOverwrite [
	1 to: 100 do: [ :i |
		| absent mapped |
		absent := false.
		cache at: i ifAbsent: [ absent := true ].
		self assert: absent.
		cache at: i put: 'zork'.
		mapped := cache at: i put: i greaseString.
		self assert: mapped = i greaseString.
		mapped := cache at: i ifAbsent: [ self assert: false ].
		self assert: mapped = i greaseString ]
]

{ #category : #testing }
WACacheTest >> testKeysAndValuesDo [
	| reference readBack |
	reference := Dictionary new.

	1 to: 100 do: [ :i |
		cache at: i put: i greaseString.
		reference at: i put: i greaseString ].
	
	readBack := Dictionary new.
	cache keysAndValuesDo: [ :key :value |
		readBack at: key put: value ].
	
	self assert: readBack = reference
]

{ #category : #testing }
WACacheTest >> testStore [
	| generator |
	generator := WAPrecomputedKeyGenerator keys: #(1 1 1 2 2 2 3).
	WAKeyGenerator
		use: generator
		during: [
			self assert: (cache store: 'key1') = 1.
			self assert: (cache store: 'key2') = 2.
			self assert: (cache store: 'key3') = 3 ]
]
