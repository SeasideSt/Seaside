"
I am a parser for JSON. It is a bit more forgiving than the standard and allows any kind of top level element except numbers, not just {} and []. See http://www.json.org/ for details.

I can be subclasses to create more sophisticated objects than just Arrays and Dictionaries. To do that, override the one or more methods in the creating protocol.
"
Class {
	#name : #WAJsonParser,
	#superclass : #WAObject,
	#instVars : [
		'stream'
	],
	#category : 'Seaside-JSON-Core'
}

{ #category : #'instance creation' }
WAJsonParser class >> new [
	self error: 'Instantiate the parser with a stream.'
]

{ #category : #'instance creation' }
WAJsonParser class >> on: aStream [
	^ self basicNew initializeOn: aStream
]

{ #category : #accessing }
WAJsonParser class >> parse: aString [
	^ self parseStream: aString readStream
]

{ #category : #accessing }
WAJsonParser class >> parseStream: aStream [
	^ (self on: aStream) parse
]

{ #category : #adding }
WAJsonParser >> addProperty: anAssociation to: anObject [
	"Add the property anAssociation described with key and value to anObject. Subclasses might want to refine this implementation."
	
	^ anObject 
		add: anAssociation;
		yourself
]

{ #category : #adding }
WAJsonParser >> addValue: anObject to: aCollection [
	"Add anObject to aCollection. Subclasses might want to refine this implementation."

	^ aCollection copyWith: anObject
]

{ #category : #creating }
WAJsonParser >> createArray [
	"Create an empty collection. Subclasses might want to refine this implementation."

	^ Array new
]

{ #category : #creating }
WAJsonParser >> createFalse [
	"Create the false literal. Subclasses might want to refine this implementation."
	
	^ false
]

{ #category : #creating }
WAJsonParser >> createNull [
	"Create the null literal. Subclasses might want to refine this implementation."

	^ nil
]

{ #category : #creating }
WAJsonParser >> createNumber: aString [
	"Create a number literal. Subclasses might want to refine this implementation."

	^ aString asNumber
]

{ #category : #creating }
WAJsonParser >> createObject [
	"Create an empty object. Subclasses might want to refine this implementation."
	
	^ Dictionary new
]

{ #category : #creating }
WAJsonParser >> createProperty: aKey with: aValue [
	"Create an empty attribute value pair. Subclasses might want to refine this implementation."
	
	^ aKey -> aValue
]

{ #category : #creating }
WAJsonParser >> createString: aString [
	"Create a string literal. Subclasses might want to refine this implementation."

	^ aString
]

{ #category : #creating }
WAJsonParser >> createTrue [
	"Create the true literal. Subclasses might want to refine this implementation."

	^ true
]

{ #category : #private }
WAJsonParser >> error: aString [
	"Raise a parse error labelled aString."

	^ WAJsonSyntaxError signal: aString
]

{ #category : #private }
WAJsonParser >> expectChar: aChar [
	"Expects aChar and consume input, throw an error otherwise."

	^ (self matchChar: aChar) ifFalse: [ self error: aChar greaseString, ' expected' ]
]

{ #category : #initialization }
WAJsonParser >> initializeOn: aStream [
	self initialize.
	stream := aStream
]

{ #category : #private }
WAJsonParser >> match: aString ifTrue: aBlock [
	" Tries to match the string, consume input and answer the value of the block if true."
	self whitespace.
	aString do: [ :each |
		(stream atEnd or: [ each ~= stream next ]) ifTrue: [ self error: aString , ' expected' ] ].
	aBlock value
]

{ #category : #private }
WAJsonParser >> matchChar: aChar [
	" Tries to match the character, consume input and answer true if successful."
	self whitespace.
	(stream atEnd or: [ stream peek ~= aChar ]) ifTrue: [ ^ false ].
	stream next.
	^ true
]

{ #category : #parsing }
WAJsonParser >> parse [
	| result |
	result := self whitespace; parseValue.
	self whitespace.
	stream atEnd
		ifFalse: [ self error: 'end of input expected' ].
	^ result
]

{ #category : #parsing }
WAJsonParser >> parseArray [
	| result |
	self expectChar: $[.
	result := self createArray.
	(self matchChar: $])
		ifTrue: [ ^ result ].
	[ stream atEnd ] whileFalse: [
		result := self
			addValue: self parseValue
			to: result.
		(self matchChar: $]) 
			ifTrue: [ ^ result ].
		self expectChar: $, ].
	self error: 'end of array expected'
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseCharacter [
	| char |
	(char := stream next) = $\ 
		ifFalse: [ ^ char ].
	(char := stream next) = $" 
		ifTrue: [ ^ char ].
	char = $\
		ifTrue: [ ^ char ].
	char = $/
		ifTrue: [ ^ char ].
	char = $b
		ifTrue: [ ^ Character backspace ].
	char = $f
		ifTrue: [ ^ Character newPage ].
	char = $n
		ifTrue: [ ^ Character lf ].
	char = $r
		ifTrue: [ ^ Character cr ].
	char = $t
		ifTrue: [ ^ Character tab ].
	char = $u
		ifTrue: [ ^ self parseCharacterHex ].
	self error: 'invalid escape character \' , (String with: char)
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseCharacterHex [
	| value |
	value := self parseCharacterHexDigit.
	3 timesRepeat: [ value := (value << 4) + self parseCharacterHexDigit ].
	^ Character codePoint: value
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseCharacterHexDigit [
	| digit |
	stream atEnd ifFalse: [ 
		digit := stream next greaseInteger.
		(digit between: "$0" 48 and: "$9" 57)
			ifTrue: [ ^ digit - 48 ].
		(digit between: "$A" 65 and: "$F" 70)
			ifTrue: [ ^ digit - 55 ].
		(digit between: "$a" 97 and: "$f" 102)
			ifTrue: [ ^ digit - 87 ] ].
	self error: 'hex-digit expected'
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseNumber [
	| negated number |
	negated := stream peek = $-.
	negated ifTrue: [ stream next ].
	number := self parseNumberInteger.
	(stream peek = $.) ifTrue: [
		stream next. 
		number := number + self parseNumberFraction ].
	('eE' includes: stream peek) ifTrue: [
		stream next.
		number := number * self parseNumberExponent ].
	negated ifTrue: [ number := number negated ].
	^ self whitespace; createNumber: number
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseNumberExponent [
	| number negated |
	number := 0.
	negated := stream peek = $-.
	(negated or: [ stream peek = $+ ]) ifTrue: [ stream next ].
	[ stream atEnd not and: [ stream peek isDigit ] ]
		whileTrue: [ number := 10 * number + (stream next greaseInteger - 48) ].
	negated ifTrue: [ number := number negated ].
	^ 10 raisedTo: number
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseNumberFraction [
	| number power |
	number := 0.
	power := 1.0.
	[ stream atEnd not and: [ stream peek isDigit ] ] whileTrue: [
		number := 10 * number + (stream next greaseInteger - 48).
		power := power * 10.0 ].
	^ number / power
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseNumberInteger [
	| number |
	number := 0.
	[ stream atEnd not and: [ stream peek isDigit ] ]
		whileTrue: [ number := 10 * number + (stream next greaseInteger - 48) ].
	^ number
]

{ #category : #parsing }
WAJsonParser >> parseObject [
	| result |
	self expectChar: ${.
	result := self createObject.
	(self matchChar: $})
		ifTrue: [ ^ result ].
	[ stream atEnd ] whileFalse: [
		result := self
			addProperty: self parseProperty
			to: result.
		(self matchChar: $})
			ifTrue: [ ^ result ].
		self expectChar: $, ].
	self error: 'end of object expected'
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseProperty [
	| name value |
	name := self parseString.
	self expectChar: $:.
	value := self parseValue.
	^ self createProperty: name with: value
]

{ #category : #'parsing-internal' }
WAJsonParser >> parseString [
	| result |
	self expectChar: $".
	result := WriteStream on: String new.
	[ stream atEnd or: [ stream peek = $" ] ] 
		whileFalse: [ result nextPut: self parseCharacter ].
	^ self expectChar: $"; createString: result contents
]

{ #category : #parsing }
WAJsonParser >> parseValue [
	stream atEnd ifFalse: [ 
		| char |
		self whitespace.
		char := stream peek.
		char = ${
			ifTrue: [ ^ self parseObject ].
		char = $[
			ifTrue: [ ^ self parseArray ].
		char = $"
			ifTrue: [ ^ self parseString ].
		(char = $- or: [ char between: $0 and: $9 ])
			ifTrue: [ ^ self parseNumber ].
		(char = $t)
			ifTrue: [ self match: 'true' ifTrue: [ ^ self createTrue ] ].
		(char = $f)
			ifTrue: [ self match: 'false' ifTrue: [ ^ self createFalse ] ].
		(char = $n)
			ifTrue: [ self match: 'null' ifTrue: [ ^ self createNull ] ] ].
	self error: 'invalid input'
]

{ #category : #private }
WAJsonParser >> whitespace [
	"Strip whitespaces from the input stream."

	[ stream atEnd not and: [ stream peek isSeparator ] ]
		whileTrue: [ stream next ]
]
