private
documentClasses
	^ WADocument withAllSubclasses asSortedCollection: [ :a :b | a name <= b name ]