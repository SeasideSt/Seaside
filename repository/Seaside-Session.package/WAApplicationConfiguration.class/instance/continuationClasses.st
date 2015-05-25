description
continuationClasses
	^ (WASessionContinuation allSubclasses reject: [ :each | each isAbstract ])
		asSortedCollection: [ :a :b | a name <= b name ]