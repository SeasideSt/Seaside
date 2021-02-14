Class {
	#name : #JSStreamTest,
	#superclass : #JSObjectTest,
	#category : 'Javascript-Tests-Core'
}

{ #category : #tests }
JSStreamTest >> testArgument [
	| stream |
	stream := self stream argument: 1.
	self assert: stream contents = '(1)'
]

{ #category : #tests }
JSStreamTest >> testArguments [
	| stream |
	stream := self stream arguments: #(1 2 3).
	self assert: stream contents = '(1,2,3)'
]

{ #category : #'tests-literals' }
JSStreamTest >> testCharacter [
	self assert: $a equals: '"a"'
]

{ #category : #'tests-literals' }
JSStreamTest >> testCodecStream [
	| actual |
	actual := String streamContents: [ :stream |
		(GRNullCodec new encoderFor: stream)
			javascript: 'OK' ].
	self assert: actual = '"OK"'
]

{ #category : #tests }
JSStreamTest >> testCopy [
	| stream1 stream2 |
	stream1 := self stream nextPutAll: 'foo'.
	stream2 := stream1 copy nextPutAll: 'bar'.
	stream1 nextPutAll: 'zork'.
	self assert: stream1 contents = 'foozork'.
	self assert: stream2 contents = 'foobar'
]

{ #category : #'tests-encoding' }
JSStreamTest >> testEncodeKeyValueOn [
	| actual |
	actual := String streamContents: [ :stream |
		JSStream encodeKey: 'key' value: 'value' on: stream ].
	self assert: actual = '"key":"value"'
]

{ #category : #tests }
JSStreamTest >> testJavascript [
	| stream |
	stream := self stream javascript: #(1 2).
	self assert: stream contents = '[1,2]'
]

{ #category : #'tests-literals' }
JSStreamTest >> testLiteral [
	self assert: true equals: 'true'.
	self assert: false equals: 'false'.
	self assert: nil equals: 'null'
]

{ #category : #'tests-constructor' }
JSStreamTest >> testNewArgument [
	self assert: (JSStream argument: 0) equals: 'arguments[0]'.
	self assert: (JSStream argument: 1) equals: 'arguments[1]'.
	self deny: (JSStream argument: 1) == (JSStream argument: 1)
]

{ #category : #'tests-constructor' }
JSStreamTest >> testNewArgumentAt [
	self assert: (JSStream argumentAt: 1) equals: 'arguments[0]'.
	self assert: (JSStream argumentAt: 2) equals: 'arguments[1]'.
	self deny: (JSStream argumentAt: 1) == (JSStream argument: 1)
]

{ #category : #'tests-constructor' }
JSStreamTest >> testNewOn [
	self assert: (JSStream on: 'mock') equals: 'mock'
]

{ #category : #'tests-constructor' }
JSStreamTest >> testNewThis [
	self assert: JSStream this equals: 'this'.
	self deny: JSStream this == JSStream this
]

{ #category : #tests }
JSStreamTest >> testNextPut [
	| stream |
	stream := self stream nextPut: $f.
	self assert: stream contents = 'f'
]

{ #category : #tests }
JSStreamTest >> testNextPutAll [
	| stream |
	stream := self stream nextPutAll: 'foo'.
	self assert: stream contents = 'foo'
]

{ #category : #'tests-literals' }
JSStreamTest >> testNumber [
	self assert: 123 equals: '123'.
	self assert: 123.4 equals: '123.4'
]

{ #category : #'tests-literals' }
JSStreamTest >> testStringBasic [
	self assert: 'abc' equals: '"abc"'.
	self assert: '123' equals: '"123"'
]

{ #category : #'tests-literals' }
JSStreamTest >> testStringEscaping [
	self assert: '''' equals: '"''"'.
	self assert: '"' equals: '"\""'.
	self assert: '\' equals: '"\\"'
]

{ #category : #'tests-literals' }
JSStreamTest >> testStringSpecial [
	self assert: (String with: Character cr) equals: '"\r"'.
	self assert: (String with: Character lf) equals: '"\n"'.
	self assert: (String with: Character tab) equals: '"\t"'.

	self assert: (String with: (Character codePoint: 0)) equals: '"\0"'.
	self assert: (String with: (Character codePoint: 1)) equals: '"\x01"'.
	self assert: (String with: (Character codePoint: 31)) equals: '"\x1f"'
]
