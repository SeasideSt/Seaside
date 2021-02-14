Class {
	#name : #WAHeaderFieldsTest,
	#superclass : #GROrderedMultiMap2Test,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #configuration }
WAHeaderFieldsTest >> collectionClass [
	^ WAHeaderFields
]

{ #category : #'tests-accessing' }
WAHeaderFieldsTest >> testAt [
	self assert: (collection removeKey: '1') isNil.
	collection add: '1' -> 'foo'.
	collection add: '1' -> 'bar'.
	self assert: (collection at: '1') =
		(self allowsDuplicateKeys ifTrue: [ 'foo' ] ifFalse: [ 'bar' ])
]

{ #category : #tests }
WAHeaderFieldsTest >> testCrLf [
	| crlf testValue |
	crlf := String with: Character cr with: Character lf.
	testValue := 'value', crlf, 'Location: www.bad.com', crlf, crlf.
	self
		should: [
			collection add: 'key' -> testValue ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection addAll: (Dictionary new
				add: 'key' -> testValue;
				yourself) ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' add: testValue ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' put: testValue ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' ifAbsentPut: [ testValue ] ]
		raise: WAInvalidHeaderValueError.
	self
		should: [
			collection at: 'key' put: testValue ]
		raise: WAInvalidHeaderValueError
	
]

{ #category : #tests }
WAHeaderFieldsTest >> testDictionaryConversion [
	| dict |
	dict := Dictionary new at: 1 put: 2; yourself.
	collection := dict seasideRequestFields.
	self assert: (collection isKindOf: WARequestFields).
	self assertAssociations: (Array with: 1 -> 2)
]

{ #category : #'tests-accessing' }
WAHeaderFieldsTest >> testRemoveKey [
	self assert: (collection removeKey: '1') isNil.
	collection add: '1' -> 'foo'.
	collection add: '1' -> 'bar'.
	collection add: '2' -> 'baz'.
	self assert: (collection removeKey: '1') =
		(self allowsDuplicateKeys ifTrue: [ #('foo' 'bar') ] ifFalse: [ 'bar' ]).
	self assertAssociations: (Array with: '2' -> 'baz').
	self assert: (collection removeKey: '2') =
		(self allowsDuplicateKeys ifTrue: [ #('baz') ] ifFalse: [ 'baz' ]).
	self assertAssociations: #()
]

{ #category : #tests }
WAHeaderFieldsTest >> testSmallDictionaryConversion [
	| dict |
	dict := GRSmallDictionary2 new at: 1 put: 2; yourself.
	collection := dict seasideRequestFields.
	self assert: (collection isKindOf: WARequestFields).
	self assertAssociations: (Array with: 1 -> 2)
]
