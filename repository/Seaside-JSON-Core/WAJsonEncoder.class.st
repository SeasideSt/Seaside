"
I am an encoder for JSON format.
"
Class {
	#name : #WAJsonEncoder,
	#superclass : #WATableBasedEncoder,
	#category : 'Seaside-JSON-Core'
}

{ #category : #initialization }
WAJsonEncoder class >> initialize [
	self initializeTable
]

{ #category : #initialization }
WAJsonEncoder class >> initializeTable [
	| printer escapes |
	printer := GRNumberPrinter new.
	printer base: 16; padding: $0; digits: 4.
	table := Array new: self maximumCharacterValue + 1.
	"write control characters"
	0 to: 31 do: [ :index | 
		table 
			at: index + 1
			put: '\u', (printer print: index) ].

	"overwrite named (control) characters"
	escapes := #( 8 '\b' 9 '\t' 10 '\n' 12 '\f' 13 '\r' 34 '\"' 92 '\\' ).
	1 to: escapes size - 1 by: 2 do: [ :index | 
		table 
			at: (escapes at: index) + 1
			put: (escapes at: index + 1) ]
]

{ #category : #private }
WAJsonEncoder class >> maximumCharacterValue [
	"Everything higher is safe."
	
	^ 16r7F
]

{ #category : #accessing }
WAJsonEncoder >> nextPut: aCharacter [ 
	| index encoded |
	index := aCharacter greaseInteger + 1.
	index > table size ifTrue: [
		stream nextPut: aCharacter.
		^ self ].
	encoded := table at: index.
	"Issue 482: use #notNil because it is faster than #isString because it is not actually sent"
	encoded notNil
		ifTrue: [ stream nextPutAll: encoded ]
		ifFalse: [ stream nextPut: aCharacter ]
]
