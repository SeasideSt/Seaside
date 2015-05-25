private
arguments
	| result |
	result := OrderedCollection with: effect.
	(options isEmpty and: [ speed isNil and: [ complete isNil ] ])
		ifFalse: [ result addLast: options ].
	(speed isNil and: [ complete isNil ])
		ifFalse: [ result addLast: speed ].
	(complete isNil)
		ifFalse: [ result addLast: complete ].
	^ result