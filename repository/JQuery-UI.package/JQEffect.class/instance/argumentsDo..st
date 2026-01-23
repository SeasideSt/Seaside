private
argumentsDo: aBlock
	aBlock value: effect.
	(options isEmpty and: [ speed isNil and: [ complete isNil ] ])
		ifFalse: [ aBlock value: options ].
	(speed isNil and: [ complete isNil ])
		ifFalse: [ aBlock value: speed ].
	(complete isNil)
		ifFalse: [ aBlock value: complete ]