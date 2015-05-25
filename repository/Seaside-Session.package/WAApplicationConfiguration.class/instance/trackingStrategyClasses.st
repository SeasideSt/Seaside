description
trackingStrategyClasses
	^ (WAHandlerTrackingStrategy allSubclasses reject: [ :each | each isAbstract ])
		asSortedCollection: [ :a :b | a name <= b name ]