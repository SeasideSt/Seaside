accessing
nextPutAll: aString 
	"#encodeUsing: is a primitive in GemStone, so it does the mapping very quickly..."
	| encodedString |
	encodedString := aString encodeUsing: table.
	encodedString ~~ nil 
		ifTrue: [ stream nextPutAll: encodedString ]
		ifFalse: [ super nextPutAll: aString ].