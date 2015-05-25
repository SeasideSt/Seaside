private
responseGenerators
	^ WAResponseGenerator withAllSubclasses asSortedCollection: [ :a :b | a name <= b name ]