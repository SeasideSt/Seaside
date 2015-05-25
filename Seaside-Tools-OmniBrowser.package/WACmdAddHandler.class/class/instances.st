accessing
instances
	^ WARequestHandler concreteSubclasses collect: [ :each | self new setType: each ]