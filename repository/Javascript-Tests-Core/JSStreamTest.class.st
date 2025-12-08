Class {
	#name : 'JSStreamTest',
	#superclass : 'JSObjectTest',
	#category : 'Javascript-Tests-Core',
	#package : 'Javascript-Tests-Core'
}

{ #category : 'tests-performance' }
JSStreamTest >> generateBestCaseString: size [
	"Generate a String containing only asciii a-z"
	| generator |
	generator := GRPlatform current newRandom.
	^ String streamContents: [:str | 
			1 to: size do:[:i |str nextPut: (Character value: 96 + (generator nextInt: 29)) ] ]
]

{ #category : 'tests-performance' }
JSStreamTest >> generateWorstCaseString: size [
	| generator |
	generator := GRPlatform current newRandom.
	^ String streamContents: [:str | 
				1 to: size do: [:i | str nextPut: (Character value: (generator nextInt: 128)) ] ].
]

{ #category : 'tests' }
JSStreamTest >> testArgument [
	| stream |
	stream := self stream argument: 1.
	self assert: stream contents = '(1)'
]

{ #category : 'tests' }
JSStreamTest >> testArguments [
	| stream |
	stream := self stream arguments: #(1 2 3).
	self assert: stream contents = '(1,2,3)'
]

{ #category : 'tests-literals' }
JSStreamTest >> testCharacter [
	self assert: $a equals: '"a"'
]

{ #category : 'tests-literals' }
JSStreamTest >> testCodecStream [
	| actual |
	actual := String streamContents: [ :stream |
		(GRNullCodec new encoderFor: stream)
			javascript: 'OK' ].
	self assert: actual = '"OK"'.
	
	"The second part of this test is in response to https://github.com/GsDevKit/Grease/issues/33"
	actual := (GRCodec forEncoding: 'utf8') encodedStringClass streamContents: [ :stream |
		((GRCodec forEncoding: 'utf8') encoderFor: stream)
			javascript: 'OK' ].
	self assert: actual asString = '"OK"'
]

{ #category : 'tests' }
JSStreamTest >> testCopy [
	| stream1 stream2 |
	stream1 := self stream nextPutAll: 'foo'.
	stream2 := stream1 copy nextPutAll: 'bar'.
	stream1 nextPutAll: 'zork'.
	self assert: stream1 contents = 'foozork'.
	self assert: stream2 contents = 'foobar'
]

{ #category : 'tests' }
JSStreamTest >> testJavascript [
	| stream |
	stream := self stream javascript: #(1 2).
	self assert: stream contents = '[1,2]'
]

{ #category : 'tests-performance' }
JSStreamTest >> testJavascriptRenderingPerformance [
	 
	| iterations size worstcasestring bestcasestring stringToStream |
	iterations := 1000.
	size := 5000.

	bestcasestring := self generateBestCaseString: size.
	worstcasestring := self generateWorstCaseString: size.
	
	Transcript show: 'Best case:';cr.
	stringToStream := self timeJavascriptRenderingOf: bestcasestring times: iterations.
	Transcript show: ('- Rendering {1} Strings with {2} chars in response: {3} ms' format: { iterations asString . size asString . stringToStream asString}); cr.
	
	Transcript show: 'Worst case:';cr.
	stringToStream := self timeJavascriptRenderingOf: worstcasestring times: iterations.
	Transcript show: ('- Rendering {1} Strings with {2} chars in response: {3} ms' format: { iterations asString . size asString . stringToStream asString}); cr.
]

{ #category : 'tests' }
JSStreamTest >> testJson [
	
		| testString |
	
		testString := String with: (Character codePoint: 16r2028).
	
		self assert: (self stream javascript: testString; contents) = '"\u2028"'.
		self assert: (self stream json: testString; contents) = ('"' , testString , '"').
]

{ #category : 'tests-literals' }
JSStreamTest >> testLiteral [
	self assert: true equals: 'true'.
	self assert: false equals: 'false'.
	self assert: nil equals: 'null'
]

{ #category : 'tests-constructor' }
JSStreamTest >> testNewArgument [
	self assert: (JSStream argument: 0) equals: 'arguments[0]'.
	self assert: (JSStream argument: 1) equals: 'arguments[1]'.
	self deny: (JSStream argument: 1) == (JSStream argument: 1)
]

{ #category : 'tests-constructor' }
JSStreamTest >> testNewArgumentAt [
	self assert: (JSStream argumentAt: 1) equals: 'arguments[0]'.
	self assert: (JSStream argumentAt: 2) equals: 'arguments[1]'.
	self deny: (JSStream argumentAt: 1) == (JSStream argument: 1)
]

{ #category : 'tests-constructor' }
JSStreamTest >> testNewOn [
	self assert: (JSStream on: 'mock') equals: 'mock'
]

{ #category : 'tests-constructor' }
JSStreamTest >> testNewThis [
	self assert: JSStream this equals: 'this'.
	self deny: JSStream this == JSStream this
]

{ #category : 'tests' }
JSStreamTest >> testNextPut [
	| stream |
	stream := self stream nextPut: $f.
	self assert: stream contents = 'f'
]

{ #category : 'tests' }
JSStreamTest >> testNextPutAll [
	| stream |
	stream := self stream nextPutAll: 'foo'.
	self assert: stream contents = 'foo'
]

{ #category : 'tests-literals' }
JSStreamTest >> testNumber [
	self assert: 123 equals: '123'.
	self assert: 123.4 equals: '123.4'
]

{ #category : 'tests-literals' }
JSStreamTest >> testStringBasic [
	self assert: 'abc' equals: '"abc"'.
	self assert: '123' equals: '"123"'
]

{ #category : 'tests-literals' }
JSStreamTest >> testStringEscaping [
	self assert: '''' equals: '"''"'.
	self assert: '"' equals: '"\""'.
	self assert: '\' equals: '"\\"'
]

{ #category : 'tests-literals' }
JSStreamTest >> testStringSpecial [
	self assert: (String with: Character cr) equals: '"\r"'.
	self assert: (String with: Character lf) equals: '"\n"'.
	self assert: (String with: Character tab) equals: '"\t"'.

	self assert: (String with: (Character codePoint: 0)) equals: '"\0"'.
	self assert: (String with: (Character codePoint: 1)) equals: '"\x01"'.
	self assert: (String with: (Character codePoint: 31)) equals: '"\x1f"'
]

{ #category : 'tests-performance' }
JSStreamTest >> timeJavascriptRenderingOf: aString times: aNumber [

	^ Time millisecondsToRun: [ 
		WACurrentRequestContext 
			use: (WARequestContext request: WARequest new response: WABufferedResponse new codec: GRNullCodec new)
			during: [
			WACurrentRequestContext value
				push: WARequestHandler new
				during: [
					(GRCodec forEncoding: 'utf-8') encodedStringClass streamContents: [:str |
						WAHtmlCanvas builder
							render: [:html | html script: ((html jQuery id: #id) replaceWith: [:h | aNumber timesRepeat: [ h div: aString ] ]) ]
							on: ((GRCodec forEncoding: 'utf-8') encoderFor: str) ] ] ] ]
]
