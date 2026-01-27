private
create
	| route |
	route := path isNil
		ifTrue: [ self createSimpleRoute ]
		ifFalse: [ self createComplexRoute ].
	optionalQueryParameters ifNotNil:[ 
		route initializeOptionalQueryFieldParametersFrom: optionalQueryParameters ].
	^ route