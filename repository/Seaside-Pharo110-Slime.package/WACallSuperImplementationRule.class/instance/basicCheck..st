running
basicCheck: aMethod

	| current superSelectors |
	aMethod methodClass isMeta
		ifTrue: [ ^ false ].

	superSelectors := Set new.
	current := aMethod methodClass superclass.
	[ current isNil ] whileFalse: [
		classesAndSelectors
			at: current name
			ifPresent: [ :values | superSelectors addAll: values ].
		current := current superclass ].
		
	^ ((superSelectors includes: aMethod selector)
		and: [ (aMethod superMessages includes: aMethod selector) not ])