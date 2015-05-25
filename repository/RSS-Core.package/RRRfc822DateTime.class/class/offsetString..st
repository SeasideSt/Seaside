private
offsetString: aDuration
	^ String streamContents: [ :stream |
		stream nextPut: (aDuration positive ifTrue: [ $+ ] ifFalse: [ $- ]).
		stream nextPutAll: (aDuration hours abs printPaddedWith: $0 to: 2 base: 10).
		stream nextPutAll: (aDuration minutes abs printPaddedWith: $0 to: 2 base: 10) ]