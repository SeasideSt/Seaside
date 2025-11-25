private - encoding
privateNextPut: aCharacter
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