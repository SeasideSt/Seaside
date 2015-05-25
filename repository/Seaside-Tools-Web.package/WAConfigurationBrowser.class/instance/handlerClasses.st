accessing
handlerClasses
	^ WARequestHandler concreteSubclasses asSortedCollection: [ :a :b | a name < b name ]