Class {
	#name : #WAJsonStreamTest,
	#superclass : #TestCase,
	#instVars : [
		'printer'
	],
	#category : 'Seaside-Tests-JSON'
}

{ #category : #asserting }
WAJsonStreamTest >> assert: anObject equals: aString [
	self
		assert: anObject asJson = aString
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true
]

{ #category : #asserting }
WAJsonStreamTest >> assert: anObject equalsIgnoreCase: aString [
	self
		assert: anObject asJson asLowercase = aString asLowercase
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true
]

{ #category : #printing }
WAJsonStreamTest >> jsonOn: aRenderer [
	printer value: aRenderer
]

{ #category : #tests }
WAJsonStreamTest >> testArray [
	self assert: #(1 2 3) equals: '[1, 2, 3]'
]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testCharacter [
	self assert: $a equals: '"a"'
]

{ #category : #'tests-custom' }
WAJsonStreamTest >> testCustomArray [
	printer := [ :renderer | renderer render: #('aString1' ('aString2' 'aString3')) ].
	self assert: self equals: '["aString1", ["aString2", "aString3"]]'
]

{ #category : #'tests-custom' }
WAJsonStreamTest >> testCustomCollection [
	printer := [ :renderer | renderer render: (GRSmallOrderedSet withAll: #('aString2' 'aString3')) ].
	self assert: self equals: '["aString2", "aString3"]'
]

{ #category : #'tests-custom' }
WAJsonStreamTest >> testCustomDictionary [
	printer := [ :renderer | 
		renderer render: (GRSmallDictionary2 new
			at: 'foo' put: 'bar';
			at: 'zork' put: (GRSmallDictionary2 new
				at: 'foo' put: 'bar';
				yourself);
			yourself) ].
	self assert: self equals: '{"foo": "bar", "zork": {"foo": "bar"}}'
]

{ #category : #tests }
WAJsonStreamTest >> testDictionary [
	self
		assert:
			((GRSmallDictionary2 new)
				at: 'foo' put: 1;
				at: 'bar' put: 2;
				at: 'zork' put: 3;
				yourself)
		equals: '{"foo": 1, "bar": 2, "zork": 3}'.
	self
		assert:
			((GRSmallDictionary2 new)
				at: '' put: 'empty';
				yourself)
		equals: '{"": "empty"}'.
	self
		assert:
			((Dictionary new)
				at: 1 put: 'not-a-string';
				yourself)
		equals: '{1: "not-a-string"}'.
	self
		assert:
			((Dictionary new)
				at: '1abc' put: 'not-an-id';
				yourself)
		equals: '{"1abc": "not-an-id"}'.
	self
		assert:
			((Dictionary new)
				at: 'abc1' put: 'totally sexy';
				yourself)
		equals: '{"abc1": "totally sexy"}'
]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testLiteral [
	self assert: true equals: 'true'.
	self assert: false equals: 'false'.
	self assert: nil equals: 'null'
]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testNumber [
	self assert: 123 equals: '123'.
	self assert: 123.4 equals: '123.4'
]

{ #category : #tests }
WAJsonStreamTest >> testObject [
	self
		should: [ Object new asJson ]
		raise: Error
]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testStringBasic [
	self assert: 'abc' equals: '"abc"'.
	self assert: '123' equals: '"123"'
]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testStringEscaping [
	self assert: '''' equals: '"''"'.
	self assert: '"' equals: '"\""'.
	self assert: '\' equals: '"\\"'
]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testStringMultiByte [
	"regression test for
	Issue 217: MultibyteString JavascriptOn infinite recursion [GemStone]
	http://code.google.com/p/glassdb/issues/detail?id=217"
	| multibyteString |
	multibyteString := String with: (Character codePoint: 8364).
	self assert: multibyteString equals: '"', multibyteString, '"'

]

{ #category : #'tests-literals' }
WAJsonStreamTest >> testStringSpecial [
	self assert: (String with: Character cr) equals: '"\r"'.
	self assert: (String with: Character lf) equals: '"\n"'.
	self assert: (String with: Character tab) equals: '"\t"'.
	self assert: (String with: (Character codePoint: 8)) equals: '"\b"'.
	self assert: (String with: (Character codePoint: 12)) equals: '"\f"'.

	"http://tools.ietf.org/html/rfc4627#section-2.5"
	0 to: 16r001F do: [ :codePoint |
		(#(8 "backspace" 9 "tab" 10 "lf" 12 "form feed" 13 "cr") includes: codePoint) ifFalse: [
			self
				assert: (String with: (Character codePoint: codePoint))
				"case doesn't matter"
				equalsIgnoreCase: '"\u', ((codePoint printStringBase: 16) padLeftTo: 4 with: $0), '"'  ] ]
]
