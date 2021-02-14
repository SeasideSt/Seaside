Class {
	#name : #WAJsonRenderingTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-JSON'
}

{ #category : #private }
WAJsonRenderingTest >> assert: aBlock gives: aString [
	| json |
	json := String streamContents: [ :stream |
		| context document canvas |
		document := WAJsonDocument on: stream.
		context := WARenderContext new
			actionUrl: WAUrl new;
			document: document;
			yourself.
		 canvas := WAJsonCanvas context: context.
		canvas render: aBlock.
		document close ].
	self
		assert: json = aString
		description:	'Expected: ' , aString printString , ', Actual: ', json printString
		resumable: true
]

{ #category : #tests }
WAJsonRenderingTest >> testArray [
	self
		assert: [ :json |
			json array: [
				json
					value: 1;
					value: '1';
					value: true;
					value: false;
					value: nil ] ]
		gives: '[1, "1", true, false, null]'.
	self
		assert: [ :json |
			json array: [
				json value: 1 ] ]
		gives: '[1]'
]

{ #category : #tests }
WAJsonRenderingTest >> testDateAndTime [
   self
       assert: [ :json |
           | date |
           date := DateAndTime year: 2007 month: 11 day: 21 hour: 14
minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0
seconds: 0).
           json array: [
               json dateAndTime: date ] ]
       gives: '["2007-11-21T14:42:48+02:00"]'
]

{ #category : #tests }
WAJsonRenderingTest >> testNestedArray [
	self
		assert: [ :json |
			json array: [
				json
					value: 1;
					value: [
						json array: [
							json value: '1' ] ];
					value: 2 ] ]
		gives: '[1, ["1"], 2]'.
	self
		assert: [ :json |
			json array: [
				json array: [
					json value: 1 ] ] ] 
		gives: '[[1]]'
]

{ #category : #tests }
WAJsonRenderingTest >> testNestedObject [
	self
		assert: [ :json |
			json object: [
				json
					key: 'a' value: 'b';
					key: '1' value: [
						json object: [
							json key: '2' value: 2 ] ];
					key: 'c' value: 'd' ] ]
		gives: '{"a": "b", "1": {"2": 2}, "c": "d"}'
]

{ #category : #tests }
WAJsonRenderingTest >> testObject [
	self
		assert: [ :json |
			json object: [
				json
					key: '1' value: '1';
					key: '2' value: 2 ] ]
		gives: '{"1": "1", "2": 2}'.
	self
		assert: [ :json |
			json object: [
				json key: '1' value: 1 ] ]
		gives: '{"1": 1}'
]

{ #category : #tests }
WAJsonRenderingTest >> testObjectValues [
	self
		assert: [ :json |
			json array: [
				json object: [
					json key: 'name' value: 'WAXmlDocument' ].
				json object: [
					json key: 'name' value: 'WAJsonDocument' ] ] ]
		gives: '[{"name": "WAXmlDocument"}, {"name": "WAJsonDocument"}]'
]

{ #category : #tests }
WAJsonRenderingTest >> testScaledDecimal [
   self
       assert: [ :json |
           json array: [
               json 
						value: (3.14 asScaledDecimal: 2);
						value: (-3 asScaledDecimal: 0);
						value: (0 asScaledDecimal: 0);
						value: (8 asScaledDecimal: 0) ] ]
       gives: '[3.14, -3, 0, 8]'
]

{ #category : #tests }
WAJsonRenderingTest >> testSpecialFloats [
	"Tests that float values that can't be represented as JSON objects are null
	http://code.google.com/p/seaside/issues/detail?id=730
	http://ecma-international.org/ecma-262/5.1/#sec-15.12.3"
	self
		assert: [ :json |
			json array: [
				json
					value: Float infinity;
					value: Float infinity * -1;
					value: Float nan ] ]
		gives: '[null, null, null]'
]

{ #category : #tests }
WAJsonRenderingTest >> testStringEscape [
	self
		assert: [ :json |
			json array: [
				json value: '"\/' ] ]
		gives: '["\"\\/"]'
]

{ #category : #tests }
WAJsonRenderingTest >> testStringEscapeNamed [
	| backSpace formFeed lineFeed carriageReturn horizontalTab |
	backSpace := Character codePoint: 8.
	horizontalTab := Character codePoint: 9.
	lineFeed := Character codePoint: 10.
	formFeed := Character codePoint: 12.
	carriageReturn := Character codePoint: 13.
	self
		assert: [ :json |
			json array: [
				json value: (String streamContents: [ :stream |
					stream
						nextPut: backSpace;
						nextPut: horizontalTab;
						nextPut: lineFeed;
						nextPut: formFeed;
						nextPut: carriageReturn ]) ] ]
		gives: '["\b\t\n\f\r"]'
]

{ #category : #tests }
WAJsonRenderingTest >> testStringEscapeUnicode [
	| lineSeparator paragraphSeparator snowMan |
	lineSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	snowMan := Character codePoint: 16r2603.
	self
		assert: [ :json |
			json array: [
				json value: (String streamContents: [ :stream |
					stream
						nextPut: lineSeparator;
						nextPut: paragraphSeparator;
						nextPut: snowMan ]) ] ]
		gives: '["', (String with: lineSeparator), (String with: paragraphSeparator), (String with: snowMan), '"]'
]

{ #category : #tests }
WAJsonRenderingTest >> testStringEscapeUnicodeSmp [
	| emoji |
	emoji := Character codePoint: 16r1F64C.
	self
		assert: [ :json |
			json array: [
				json value: (String streamContents: [ :stream |
					stream nextPut: emoji ]) ] ]
		gives: '["', (String with: emoji), '"]'
]
