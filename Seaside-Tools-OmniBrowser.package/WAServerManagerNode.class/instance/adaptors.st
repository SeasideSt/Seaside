accessing
adaptors
	^ (manager adaptors asSortedCollection: [ :a :b | a port < b port ]) collect: [ :each | each asNode ]