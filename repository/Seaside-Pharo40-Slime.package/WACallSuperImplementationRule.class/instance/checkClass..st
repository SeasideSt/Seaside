running
checkClass: aContext
	| current |
	superSelectors := Set new.
	aContext isMeta
		ifTrue: [ ^ self ].
	current := aContext superclass.
	[ current isNil ] whileFalse: [
		classesAndSelectors
			at: current name
			ifPresent: [ :values | superSelectors addAll: values ].
		current := current superclass ]