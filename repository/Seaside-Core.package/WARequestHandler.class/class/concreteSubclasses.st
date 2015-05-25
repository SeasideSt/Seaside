accessing
concreteSubclasses
	^ self allSubclasses reject: [ :each | each isAbstract ]