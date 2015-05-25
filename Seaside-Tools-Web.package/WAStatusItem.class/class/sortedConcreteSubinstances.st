instance creation
sortedConcreteSubinstances
	^ ((self allSubclasses
		reject: [ :each | each isAbstract ])
		collect: [ :each | each new ])
			sorted