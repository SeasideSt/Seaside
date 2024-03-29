Class {
	#name : 'WAJsonStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'printer'
	],
	#category : 'Seaside-Tests-JSON',
	#package : 'Seaside-Tests-JSON'
}

{ #category : 'asserting' }
WAJsonStreamTest >> assert: anObject gives: aString [
	self
		assert: anObject asJson = aString
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true
]

{ #category : 'asserting' }
WAJsonStreamTest >> assert: anObject givesIgnoreCase: aString [
	self
		assert: anObject asJson asLowercase = aString asLowercase
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true
]

{ #category : 'printing' }
WAJsonStreamTest >> jsonOn: aRenderer [
	printer value: aRenderer
]

{ #category : 'tests' }
WAJsonStreamTest >> testArray [
	self assert: #(1 2 3) gives: '[1, 2, 3]'
]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testCharacter [
	self assert: $a gives: '"a"'
]

{ #category : 'tests-custom' }
WAJsonStreamTest >> testCustomArray [
	printer := [ :renderer | renderer render: #('aString1' ('aString2' 'aString3')) ].
	self assert: self gives: '["aString1", ["aString2", "aString3"]]'
]

{ #category : 'tests-custom' }
WAJsonStreamTest >> testCustomCollection [
	printer := [ :renderer | renderer render: (GRSmallOrderedSet withAll: #('aString2' 'aString3')) ].
	self assert: self gives: '["aString2", "aString3"]'
]

{ #category : 'tests-custom' }
WAJsonStreamTest >> testCustomDictionary [
	printer := [ :renderer | 
		renderer render: (GRSmallDictionary2 new
			at: 'foo' put: 'bar';
			at: 'zork' put: (GRSmallDictionary2 new
				at: 'foo' put: 'bar';
				yourself);
			yourself) ].
	self assert: self gives: '{"foo": "bar", "zork": {"foo": "bar"}}'
]

{ #category : 'tests' }
WAJsonStreamTest >> testDictionary [
	self
		assert:
			((GRSmallDictionary2 new)
				at: 'foo' put: 1;
				at: 'bar' put: 2;
				at: 'zork' put: 3;
				yourself)
		gives: '{"foo": 1, "bar": 2, "zork": 3}'.
	self
		assert:
			((GRSmallDictionary2 new)
				at: '' put: 'empty';
				yourself)
		gives: '{"": "empty"}'.

	self
		assert:
			((Dictionary new)
				at: '1abc' put: 'not-an-id';
				yourself)
		gives: '{"1abc": "not-an-id"}'.
	self
		assert:
			((Dictionary new)
				at: 'abc1' put: 'totally sexy';
				yourself)
		gives: '{"abc1": "totally sexy"}'
]

{ #category : 'tests' }
WAJsonStreamTest >> testDictionaryWithNonStringKeys [

	WAJsonKeyValueBrush stringKeysOnly: true.
	
	self
		should: [
			(Dictionary new
				 at: #( 1 2 ) put: 'awkward';
				 yourself) asJson ]
		raise: Error
		withExceptionDo: [ :e | self assert: e messageText equals: 'Only Strings can be used as keys in JSON objects.' ].
		
	self
		should: [
			((Dictionary new)
				at: 1 put: 'not-a-string';
				yourself) asJson ]
		raise: Error
		withExceptionDo: [ :e | self assert: e messageText equals: 'Only Strings can be used as keys in JSON objects.' ].
]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testLiteral [
	self assert: true gives: 'true'.
	self assert: false gives: 'false'.
	self assert: nil gives: 'null'
]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testNumber [
	self assert: 123 gives: '123'.
	self assert: 123.4 gives: '123.4'
]

{ #category : 'tests' }
WAJsonStreamTest >> testObject [
	self
		should: [ Object new asJson ]
		raise: Error
]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testStringBasic [
	self assert: 'abc' gives: '"abc"'.
	self assert: '123' gives: '"123"'
]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testStringEscaping [
	self assert: '''' gives: '"''"'.
	self assert: '"' gives: '"\""'.
	self assert: '\' gives: '"\\"'
]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testStringMultiByte [
	"regression test for
	Issue 217: MultibyteString JavascriptOn infinite recursion [GemStone]
	http://code.google.com/p/glassdb/issues/detail?id=217"
	| multibyteString |
	multibyteString := String with: (Character codePoint: 8364).
	self assert: multibyteString gives: '"', multibyteString, '"'

]

{ #category : 'tests-literals' }
WAJsonStreamTest >> testStringSpecial [
	self assert: (String with: Character cr) gives: '"\r"'.
	self assert: (String with: Character lf) gives: '"\n"'.
	self assert: (String with: Character tab) gives: '"\t"'.
	self assert: (String with: (Character codePoint: 8)) gives: '"\b"'.
	self assert: (String with: (Character codePoint: 12)) gives: '"\f"'.

	"http://tools.ietf.org/html/rfc4627#section-2.5"
	0 to: 16r001F do: [ :codePoint |
		(#(8 "backspace" 9 "tab" 10 "lf" 12 "form feed" 13 "cr") includes: codePoint) ifFalse: [
			self
				assert: (String with: (Character codePoint: codePoint))
				"case doesn't matter"
				givesIgnoreCase: '"\u', ((codePoint printStringBase: 16) padLeftTo: 4 with: $0), '"'  ] ]
]
