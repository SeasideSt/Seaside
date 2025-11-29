accessing
argumentsDo: aBlock
	action isNil
		ifFalse: [ aBlock value: action ].
	arguments isNil
		ifFalse: [ arguments do: aBlock ].
	(options isNil or: [ options isEmpty ])
		ifFalse: [ aBlock value: options ]