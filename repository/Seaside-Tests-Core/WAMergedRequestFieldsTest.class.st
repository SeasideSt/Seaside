Class {
	#name : #WAMergedRequestFieldsTest,
	#superclass : #TestCase,
	#instVars : [
		'merged',
		'one',
		'two'
	],
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #running }
WAMergedRequestFieldsTest >> setUp [
	merged := WAMergedRequestFields on: (Array 
		with: (one := WARequestFields new) 
		with: (two := WARequestFields new))
]

{ #category : #'tests-accessing' }
WAMergedRequestFieldsTest >> testAllAt [
	one at: 'one' put: 1.
	one at: 'both' put: 1.
	two at: 'two' put: 2.
	two at: 'both' put: 2.
	
	self assert: (merged allAt: 'one') = #(1).
	self assert: (merged allAt: 'two') = #(2).
	self assert: (merged allAt: 'both') = #(1 2).
	self assert: (merged allAt: 'neither') = #()

]

{ #category : #'tests-accessing' }
WAMergedRequestFieldsTest >> testAllAtIfAbsent [
	one at: 'one' put: 1.
	one at: 'both' put: 1.
	two at: 'two' put: 2.
	two at: 'both' put: 2.
	
	self assert: (merged allAt: 'one' ifAbsent: [ 'absent' ]) = #(1).
	self assert: (merged allAt: 'two' ifAbsent: [ 'absent' ]) = #(2).
	self assert: (merged allAt: 'both' ifAbsent: [ 'absent' ]) = #(1 2).
	self assert: (merged allAt: 'neither' ifAbsent: [ 'absent' ]) = 'absent'

]

{ #category : #'tests-enumerating' }
WAMergedRequestFieldsTest >> testAssociationsDo [
	| keys values |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	keys := OrderedCollection new.
	values := OrderedCollection new.
	merged associationsDo: [ :assoc | 
		keys add: assoc key.
		values add: assoc value ].
	self assert: keys asArray = #('foo' 'bar' 'foo').
	self assert: values asArray = #(1 2 3)
]

{ #category : #'tests-accessing' }
WAMergedRequestFieldsTest >> testAt [
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.

	self assert: (merged at: 'foo') = 1.
	self assert: (merged at: 'bar') = 2.
	two at: 'foo' put: 3.
	self assert: (merged at: 'foo') = 1.
	self assert: (merged at: 'zork') isNil

]

{ #category : #'tests-accessing' }
WAMergedRequestFieldsTest >> testAtIfAbsent [
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.

	self assert: (merged at: 'foo' ifAbsent: [ true ]) = 1.
	self assert: (merged at: 'bar' ifAbsent: [ true ]) = 2.
	two at: 'foo' put: 3.
	self assert: (merged at: 'foo' ifAbsent: [ true ]) = 1.
	self assert: (merged at: 'zork' ifAbsent: [ true ])
]

{ #category : #'tests-accessing' }
WAMergedRequestFieldsTest >> testAtIfPresent [
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.

	self assert: (merged 
		at: 'foo' 
		ifPresent: [ :value | self assert: value = 1. true ]).
	self assert: (merged
		at: 'bar'
		ifPresent: [ :value | self assert: value = 2. true ]).
	two at: 'foo' put: 3.
	self assert: (merged 
		at: 'foo' 
		ifPresent: [ :value | self assert: value = 1. true ]).
	merged
		at: 'zork'
		ifPresent: [ :value | self assert: false ]
]

{ #category : #'tests-enumerating' }
WAMergedRequestFieldsTest >> testDo [
	| result |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	result := OrderedCollection new.
	merged do: [ :each | result add: each ].
	self assert: result asArray = #(1 2 3)
]

{ #category : #'tests-testing' }
WAMergedRequestFieldsTest >> testIncludesKey [
	one at: 'foo' put: 1.
	two at: 'baz' put: 3.
	two at: 'bar' put: 2.
	two at: 'baz' put: 3.
	self assert: (merged includesKey: 'foo').
	self assert: (merged includesKey: 'bar').
	self assert: (merged includesKey: 'baz').
	self deny: (merged includesKey: 'zork')
]

{ #category : #'tests-testing' }
WAMergedRequestFieldsTest >> testIsEmpty [
	self assert: merged isEmpty.
	two at: 'bar' put: 2.
	self deny: merged isEmpty.
	two removeKey: 'bar'.
	one at: 'foo' put: 1.
	self deny: merged isEmpty.
	two at: 'foo' put: 2.
	self deny: merged isEmpty
]

{ #category : #tests }
WAMergedRequestFieldsTest >> testKeyNotFound [
	self assert: (merged at: 'foo') isNil
]

{ #category : #'tests-enumerating' }
WAMergedRequestFieldsTest >> testKeys [
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	self assert: merged keys asArray = #('foo' 'bar' 'foo')
]

{ #category : #'tests-enumerating' }
WAMergedRequestFieldsTest >> testKeysAndValuesDo [
	| keys values |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	keys := OrderedCollection new.
	values := OrderedCollection new.
	merged keysAndValuesDo: [ :key :value | 
		keys add: key.
		values add: value ].
	self assert: keys asArray = #('foo' 'bar' 'foo').
	self assert: values asArray = #(1 2 3)
]

{ #category : #'tests-enumerating' }
WAMergedRequestFieldsTest >> testKeysDo [
	| result |
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	result := OrderedCollection new.
	merged keysDo: [ :each | result add: each ].
	self assert: result asArray = #('foo' 'bar' 'foo')
]

{ #category : #tests }
WAMergedRequestFieldsTest >> testReadOnly [
	self
		should: [ merged at: 'foo' put: 1 ]
		raise: Error.
	self
		should: [ merged at: 'foo' ifAbsentPut: [ 1 ] ]
		raise: Error.
	self
		should: [ merged removeKey: 'foo' ]
		raise: Error
		
]

{ #category : #'tests-accessing' }
WAMergedRequestFieldsTest >> testSize [
	self assert: merged size = 0.
	one at: 'foo' put: 1.
	self assert: merged size = 1.
	two at: 'foo' put: 2.
	self assert: merged size = 2.
	two at: 'bar' put: 4.
	self assert: merged size = 3
	
]

{ #category : #'tests-enumerating' }
WAMergedRequestFieldsTest >> testValues [
	one at: 'foo' put: 1.
	two at: 'bar' put: 2.
	two at: 'foo' put: 3.
	self assert: merged values asArray = #(1 2 3)
]
