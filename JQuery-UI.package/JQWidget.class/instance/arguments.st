accessing
arguments
	| result |
	result := OrderedCollection new.
	action isNil
		ifFalse: [ result addLast: action ].
	arguments isNil
		ifFalse: [ result addAll: arguments ].
	(options isNil or: [ options isEmpty ])
		ifFalse: [ result addLast: options ].
	^ result