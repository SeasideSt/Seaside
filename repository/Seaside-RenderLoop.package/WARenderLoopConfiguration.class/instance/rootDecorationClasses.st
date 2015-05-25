description
rootDecorationClasses
	^ (WADecoration allSubclasses select: [ :each | each canBeRoot ])
		asSortedCollection: [ :a :b | a name <= b name ]