Class {
	#name : #WAGsUrlEncoder,
	#superclass : #WAUrlEncoder,
	#category : 'Seaside-GemStone-Core'
}

{ #category : #initialization }
WAGsUrlEncoder class >> initialize [
	self initializeTable
]

{ #category : #accessing }
WAGsUrlEncoder >> nextPutAll: aString [ 
	"#encodeUsing: is a primitive in GemStone, so it does the mapping very quickly..."
	| encodedString |
	encodedString := aString encodeUsing: table.
	encodedString ~~ nil 
		ifTrue: [ stream nextPutAll: encodedString ]
		ifFalse: [ super nextPutAll: aString ].
]
