"
I represent a verbatim JavaScript string. I support streaming facilities to efficiently encode JavaScript input.
"
Class {
	#name : 'JSStream',
	#superclass : 'JSObject',
	#instVars : [
		'fragments'
	],
	#classVars : [
		'Arguments',
		'JavascriptCharacters',
		'This'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'instance creation' }
JSStream class >> argument: anInteger [
	^ (Arguments at: anInteger + 1) copy
]

{ #category : 'instance creation' }
JSStream class >> argumentAt: anInteger [
	^ (Arguments at: anInteger) copy
]

{ #category : 'encoding' }
JSStream class >> encodeKey: aKey value: aValue on: aStream [ 
	"Key-value pairs are common structures in JavaScript."
	
	aStream javascript: aKey greaseString; nextPut: $:; javascript: aValue
]

{ #category : 'encoding - private' }
JSStream class >> encodeLessThanIn: aString at: anInteger on: aStream [
	"Encode <, answer the number of characters coded"

	#('<!--' '<script' '</script') do: [ :each |
		(self hasString: aString subString: each at: anInteger) ifTrue: [
			aStream nextPutAll: '\x3C'.
			aStream greaseNext: each size - 1 putAll: each startingAt: 2.
			^ each size ]. ].
	aStream nextPut: $<.
	^ 1
]

{ #category : 'encoding - private' }
JSStream class >> encodeNonAsciiCharacter: aCharacter withCodePoint: anInteger on: aStream [
	"U+2028 and U+2029 have to be treated as new lines"

	anInteger = 16r2028 "Line separator"
		ifTrue: [ aStream nextPutAll: '\u2028' ]
		ifFalse: [
			anInteger = 16r2029 "Paragraph separator"
				ifTrue: [ aStream nextPutAll: '\u2029' ]
				ifFalse: [ aStream nextPut: aCharacter ] ]
]

{ #category : 'encoding - private' }
JSStream class >> hasString: aString subString: aSubstring at: anIntegerIndex [
	"Strings with < a complicated encoding in Javascript"

	(anIntegerIndex + aSubstring size) > (aString size + 1) ifTrue: [
		^ false ].
	1 to: aSubstring size do: [ :index |
		(aString at: anIntegerIndex + index - 1) = (aSubstring at: index)
			ifFalse: [ ^ false ] ].
	^ true
]

{ #category : 'initialization' }
JSStream class >> initialize [

	self initializeEncoding.
	self initializeSnippets
]

{ #category : 'initialization' }
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

{ #category : 'initialization' }
JSStream class >> initializeSnippets [
	This := self on: 'this'.
	Arguments := (0 to: 25)
		collect: [ :each | self on: 'arguments[' , each printString , ']' ]
]

{ #category : 'instance creation' }
JSStream class >> on: aString [
	^ self new nextPutAll: aString
]

{ #category : 'instance creation' }
JSStream class >> this [
	^ This copy
]

{ #category : 'instance creation' }
JSStream class >> withFragments: anObject [
	^ self basicNew initializeWithFragments: anObject
]

{ #category : 'private' }
JSStream >> add: anObject [

	fragments add: anObject
]

{ #category : 'convenience' }
JSStream >> argument: anObject [

	self add: (JSArgument with: anObject)
]

{ #category : 'convenience' }
JSStream >> arguments: aCollection [

	self add: (JSArguments withAll: aCollection)
]

{ #category : 'copying' }
JSStream >> copy [

	^ self class withFragments: fragments copy
]

{ #category : 'initialization' }
JSStream >> initialize [

	super initialize.
	fragments := OrderedCollection new: 2
]

{ #category : 'initialization' }
JSStream >> initializeWithFragments: anObject [

	super initialize.
	fragments := anObject
]

{ #category : 'streaming' }
JSStream >> javascript: anObject [

	self add: anObject
]

{ #category : 'printing' }
JSStream >> javascriptContentOn: aRenderer [

	fragments do: [ :each |
		aRenderer render: each ]
]

{ #category : 'streaming' }
JSStream >> json: anObject [

	self nextPutAll: anObject asJson
]

{ #category : 'streaming' }
JSStream >> nextPut: aCharacter [

	"quite inefficient, ideally rare"
	self add: (JSCode on: aCharacter greaseString)
]

{ #category : 'streaming' }
JSStream >> nextPutAll: aString [

	self add: (JSCode on: aString)
]
