description
rootClasses
	^ (WAComponent allSubclasses select: [ :each | each canBeRoot ])
		asSortedCollection: [ :a :b | a name <= b name ]