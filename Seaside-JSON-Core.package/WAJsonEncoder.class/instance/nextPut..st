accessing
nextPut: aCharacter 
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