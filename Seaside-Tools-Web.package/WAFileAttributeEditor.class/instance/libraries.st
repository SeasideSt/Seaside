accessing
libraries
	^ configuration asSortedCollection: [ :a :b | a name < b name ]