"
I am an encoder for strings in Javascript nested in html documents.

"
Class {
	#name : 'JSJavascriptStringEncoder',
	#superclass : 'WATableBasedEncoder',
	#instVars : [
		'buffer',
		'offset'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'initialization' }
JSJavascriptStringEncoder class >> initialize [
	self initializeTable
]

{ #category : 'initialization' }
JSJavascriptStringEncoder class >> initializeTable [
	| printer escapes |
	printer := GRNumberPrinter new.
	printer base: 16; padding: $0; digits: 2.
	table := Array new: self maximumCharacterValue + 1.
	"write control characters"
	0 to: 31 do: [ :index | 
		table 
			at: index + 1
			put: '\x', (printer print: index) ].

	"overwrite named (control) characters"
	escapes := #(0 '\0' 8 '\b' 9 '\t' 10 '\n' 12 '\f' 13 '\r' 34 '\"' 92 '\\' ).
	1 to: escapes size - 1 by: 2 do: [ :index | 
		table 
			at: (escapes at: index) + 1
			put: (escapes at: index + 1) ]
]

{ #category : 'private' }
JSJavascriptStringEncoder class >> maximumCharacterValue [
	"Everything higher is safe."
	
	^ 16r7F
]

{ #category : 'private' }
JSJavascriptStringEncoder >> bufferCharacter: aCharacter [

	buffer at: offset put: aCharacter.
	offset := offset + 1.
]

{ #category : 'private' }
JSJavascriptStringEncoder >> bufferIsEmpty [

	^ offset = 1
]

{ #category : 'private - encoding' }
JSJavascriptStringEncoder >> encodeNonAsciiCharacter: aCharacter withCodePoint: anInteger [
	"U+2028 and U+2029 have to be treated as new lines"

	anInteger = 16r2028 "Line separator"
		ifTrue: [ stream nextPutAll: '\u2028' ]
		ifFalse: [
			anInteger = 16r2029 "Paragraph separator"
				ifTrue: [ stream nextPutAll: '\u2029' ]
				ifFalse: [ stream nextPut: aCharacter ] ]
]

{ #category : 'private - encoding' }
JSJavascriptStringEncoder >> flushBuffer [

	self bufferIsEmpty ifTrue: [ ^ self ].
	buffer doWithIndex:[:char :index | 
		index = offset ifTrue:[ offset := 1. ^ self ].
		self privateNextPut: char ].
	offset := 1.
]

{ #category : 'private - encoding' }
JSJavascriptStringEncoder >> flushBufferWhenNeeded [
	"Writes the contents of the buffer to the stream when it can be decided that encoding the $< as \x3C should happen or not."

	| contentsOfBuffer |
	contentsOfBuffer := String withAll: (buffer copyFrom: 1 to: offset - 1).
	(#('<!--' '<script' '</script') anySatisfy: [ :toBeEncoded | toBeEncoded greaseBeginsWith: contentsOfBuffer ])
		ifTrue:[
			"Encode the $< and flush the buffer to the stream if we have written one of the given character sequences completely.
			Otherwise, continue buffering."
			(#('<!--' '<script' '</script') detect: [ :toBeEncoded | toBeEncoded = contentsOfBuffer ] ifNone: [ nil ])
				isNil ifFalse:[
					stream nextPutAll: '\x3C'.
					stream greaseNext: contentsOfBuffer size - 1 putAll: contentsOfBuffer startingAt: 2.
					offset := 1 ].
			^ self ].
	"We are not buffering any of the given character sequences, so flush the buffer to the stream and apply regular encoding."
	self flushBuffer
]

{ #category : 'initialization' }
JSJavascriptStringEncoder >> initialize [

	super initialize.
	buffer := Array new: 8.
	offset := 1
]

{ #category : 'accessing' }
JSJavascriptStringEncoder >> nextPut: aCharacter [

	"Encoding for $< in Javascript strings. See https://html.spec.whatwg.org/multipage/scripting.html#restrictions-for-contents-of-script-elements"
	(aCharacter = $< and:[ self bufferIsEmpty ]) ifTrue:[
		"We encountered a $<, start buffering the characters."
		^ self bufferCharacter: aCharacter ].
	self bufferIsEmpty ifFalse:[
		"We are currently buffering characters (starting with a $<); check if we can flush the buffer and encode it if necesary."
		self bufferCharacter: aCharacter.
		^ self flushBufferWhenNeeded ].
	
	self privateNextPut: aCharacter
]

{ #category : 'private - encoding' }
JSJavascriptStringEncoder >> privateNextPut: aCharacter [
	| value index encoded |
	
	value := aCharacter greaseInteger.
	index := value + 1.
	index > table size ifTrue: [
		^ self encodeNonAsciiCharacter: aCharacter withCodePoint: value ].
	encoded := table at: index.
	"Issue 482: use #notNil because it is faster than #isString because it is not actually sent"
	encoded notNil
		ifTrue: [ stream nextPutAll: encoded ]
		ifFalse: [ stream nextPut: aCharacter ]
]
