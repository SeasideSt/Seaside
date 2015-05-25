accessing
nextPut: aCharacter 
	| value encoded |
	value := aCharacter greaseInteger.
	encoded := table at: value + 1.
	"Issue 482: use #notNil because it is faster than #isString because it is not actually sent"
	encoded notNil
		ifTrue: [ stream nextPutAll: encoded ]
		ifFalse: [ stream nextPut: aCharacter ]