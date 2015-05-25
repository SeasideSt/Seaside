accessing
bytes: anInteger
	anInteger isZero
		ifTrue: [
			multiplier := 0.
			self value: 0 ]
		ifFalse: [
			multiplier := self unitDictionary keys sorted inject: 1 into: [ :last :each |
					(anInteger \\ each) isZero
						ifTrue: [ each ]
						ifFalse: [ last ] ].
			self value: (anInteger // multiplier) ]