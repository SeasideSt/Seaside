accessing
nextPut: aCharacter 
	| index encoded |
	index := aCharacter greaseInteger + 1.
	index > table size ifTrue: [
		(index = (16r2028 + 1)) ifTrue: [
			stream nextPutAll: '\u2028'.
			^ self ].
		(index = (16r2029 + 1)) ifTrue: [
			stream nextPutAll: '\u2029'.
			^ self ].
		stream nextPut: aCharacter.
		^ self ].
	encoded := table at: index.
	"Issue 482: use #notNil because it is faster than #isString because it is not actually sent"
	encoded notNil
		ifTrue: [ stream nextPutAll: encoded ]
		ifFalse: [ stream nextPut: aCharacter ]