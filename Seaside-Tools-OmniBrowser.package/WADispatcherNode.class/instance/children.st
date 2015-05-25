accessing
children
	^ (handler handlers collect: [ :each | each asNode ])
		asSortedCollection: [ :a :b | a name < b name ]