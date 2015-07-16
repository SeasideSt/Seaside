accessing
nextPutAll: aString 
	"#encodeUsing: is a primitive in GemStone, so it does the mapping very quickly..."
	| encodedString |
	encodedString := aString encodeUsing: table.
	encodedString ~~ nil 
		ifTrue: [ stream nextPutAll: encodedString ]
		ifFalse: [ 1 to: aString size do: [ :index |self nextPut: (aString at: index) ]].