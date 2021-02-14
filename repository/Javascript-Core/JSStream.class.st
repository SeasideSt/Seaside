"
I represent a verbatim JavaScript string. I support streaming facilities to efficiently encode JavaScript input.
"
Class {
	#name : #JSStream,
	#superclass : #JSObject,
	#instVars : [
		'stream'
	],
	#classVars : [
		'Arguments',
		'JavascriptCharacters',
		'This'
	],
	#category : 'Javascript-Core-Base'
}

{ #category : #'instance creation' }
JSStream class >> argument: anInteger [
	^ (Arguments at: anInteger + 1) copy
]

{ #category : #'instance creation' }
JSStream class >> argumentAt: anInteger [
	^ (Arguments at: anInteger) copy
]

{ #category : #encoding }
JSStream class >> encodeArguments: aCollection on: aStream [ 
	"Writes aCollection of elements to aStream enclosed in round brakes and separated by a comma."
	
	aStream nextPut: $(.
	aCollection
		do: [ :each | aStream javascript: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $)
]

{ #category : #encoding }
JSStream class >> encodeCollection: aCollection on: aStream [
	"Writes aCollection of elements to aStream enclosed in square brackets."
	
	aStream nextPut: $[.
	aCollection
		do: [ :each | aStream javascript: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $]
]

{ #category : #encoding }
JSStream class >> encodeDictionary: aDictionary on: aStream [ 
	"Dictionary or hash-maps common structures in JavaScript, try to optimize their serialization."
	
	| first |
	first := true.
	aStream nextPut: ${.
	aDictionary keysAndValuesDo: [ :key :value |
		first
			ifTrue: [ first := false ]
			ifFalse: [ aStream nextPut: $, ].
		self encodeKey: key value: value on: aStream ].
	aStream nextPut: $}
]

{ #category : #encoding }
JSStream class >> encodeKey: aKey value: aValue on: aStream [ 
	"Key-value pairs are common structures in JavaScript."
	
	aStream javascript: aKey greaseString; nextPut: $:; javascript: aValue
]

{ #category : #encoding }
JSStream class >> encodeString: aString on: aStream [ 
	"Strings have a complicated encoding in Javascript, try to optimize their serialization."
		
	aStream nextPut: $".
	1 to: aString size do: [ :index | 
		| char value encoded |
		char := aString at: index.
		value := char greaseInteger.
		value < JavascriptCharacters size 
			ifFalse: [
				"U+2028 and U+2029 have to be treaded as new lines"
				value = 16r2028 "Line separator"
					ifTrue: [ aStream nextPutAll: '\u2028' ]
					ifFalse: [
						value = 16r2029 "Paragraph separator"
							ifTrue: [ aStream nextPutAll: '\u2029' ]
							ifFalse: [ aStream nextPut: char ] ] ]
			ifTrue: [
				encoded := JavascriptCharacters at: value + 1.
				"we use nil markers becausee #isNil is faster than #isString because it's not
				actually sent"
				encoded isNil 
					ifTrue: [ aStream nextPut: char ]
					ifFalse: [ aStream nextPutAll: encoded ] ] ].
	aStream nextPut: $"
]

{ #category : #initialization }
JSStream class >> initialize [

	self initializeEncoding.
	self initializeSnippets
]

{ #category : #initialization }
JSStream class >> initializeEncoding [
	| printer escapes |
	printer := GRNumberPrinter new.
	printer base: 16; padding: $0; digits: 2.
	JavascriptCharacters := Array new: 128.
	0 to: 31 do: [ :index | 
		JavascriptCharacters 
			at: index + 1
			put: '\x' , (printer print: index) ].
	escapes := #( 0 '\0' 7 '\a' 8 '\b' 9 '\t' 10 '\n' 12 '\f' 13 '\r' 34 '\"' 92 '\\' ).
	1 to: escapes size - 1 by: 2 do: [ :index | 
		JavascriptCharacters 
			at: (escapes at: index) + 1
			put: (escapes at: index + 1) ]
]

{ #category : #initialization }
JSStream class >> initializeSnippets [
	This := self on: 'this'.
	Arguments := (0 to: 25)
		collect: [ :each | self on: 'arguments[' , each printString , ']' ]
]

{ #category : #'instance creation' }
JSStream class >> on: aString [
	^ self new nextPutAll: aString
]

{ #category : #'instance creation' }
JSStream class >> this [
	^ This copy
]

{ #category : #convenience }
JSStream >> argument: anObject [
	"Write a single argument anObject onto the receiving stream."

	self arguments: (Array with: anObject)
]

{ #category : #convenience }
JSStream >> arguments: aCollection [
	"Write aCollection of arguments onto the stream."

	self class encodeArguments: aCollection on: self
]

{ #category : #accessing }
JSStream >> contents [
	^ self stream contents
]

{ #category : #copying }
JSStream >> copy [
	^ self class on: self contents
]

{ #category : #initialization }
JSStream >> initialize [
	super initialize.
	stream := WriteStream on: String new
]

{ #category : #streaming }
JSStream >> javascript: anObject [
	self stream javascript: anObject
]

{ #category : #printing }
JSStream >> javascriptContentOn: aStream [
	aStream nextPutAll: self contents
]

{ #category : #streaming }
JSStream >> json: anObject [
	self stream json: anObject
]

{ #category : #streaming }
JSStream >> nextPut: aCharacter [
	self stream nextPut: aCharacter
]

{ #category : #streaming }
JSStream >> nextPutAll: aString [
	self stream nextPutAll: aString
]

{ #category : #accessing }
JSStream >> stream [
	^ stream
]
