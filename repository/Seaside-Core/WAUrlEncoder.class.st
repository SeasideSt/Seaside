"
I do percent-encoding of parts (e.g. path segments and arguments) of a URI.

Additionally, a Codec is given the chance to encode the characters into bytes before being percent-encoded (see http://tools.ietf.org/html/rfc3986#section-2.5). This allows extended characters to be represented in URIs in, for example, UTF-8.
"
Class {
	#name : 'WAUrlEncoder',
	#superclass : 'WATableBasedEncoder',
	#category : 'Seaside-Core-Document',
	#package : 'Seaside-Core',
	#tag : 'Document'
}

{ #category : 'private' }
WAUrlEncoder class >> encode: aCharacter on: aStream [ 
	| printer |
	('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.~' includes: aCharacter) ifTrue: [ ^ aStream nextPut: aCharacter ].
	aStream nextPut: $%.
	printer := GRNumberPrinter new.
	printer
		base: 16;
		padding: $0;
		digits: 2;
		uppercase.
	printer 
		print: aCharacter greaseInteger
		on: aStream
]

{ #category : 'initialization' }
WAUrlEncoder class >> initialize [
	self initializeTable
]

{ #category : 'initialization' }
WAUrlEncoder class >> initializeTable [
	"Initializes the encoding table."
	| stream characterLimit |
	characterLimit := self maximumCharacterValue.
	"character values at zero so we need to add 1"
	table := Array new: characterLimit + 1.
	stream := WriteStream on: (String new: 6).
	0 to: characterLimit do: [ :index | 
		| character value |
		character := Character codePoint: index.
		self encode: character on: stream reset.
		"Smalltalk indices are one based but character values start at 0"
		value := stream contents = (String with: character)
			ifTrue: [ nil ]
			ifFalse: [ stream contents ].
		table at: index + 1 put: value ]
]

{ #category : 'private' }
WAUrlEncoder class >> maximumCharacterValue [
	"String to byte encoding has already happened in the server."
	
	^ 16rFF
]

{ #category : 'instance creation' }
WAUrlEncoder class >> on: aStream codec: aCodec [
	^ aCodec url encoderFor: (self on: aStream table: table)
]

{ #category : 'accessing' }
WAUrlEncoder >> nextPut: aCharacter [ 
	| value encoded |
	value := aCharacter greaseInteger.
	encoded := table at: value + 1.
	"Issue 482: use #notNil because it is faster than #isString because it is not actually sent"
	encoded notNil 
		ifTrue: [ stream nextPutAll: encoded ]
		ifFalse: [ stream nextPut: aCharacter asCharacter ]
]
