running
checkClass: aContext
	| current |
	superSelectors := Set new.
	aContext selectedClass isMeta
		ifTrue: [ ^ self ].
	current := aContext selectedClass superclass.
	[ current isNil ] whileFalse: [
		classesAndSelectors
			at: current name
			ifPresent: [ :values | superSelectors addAll: values ].
		current := current superclass ]