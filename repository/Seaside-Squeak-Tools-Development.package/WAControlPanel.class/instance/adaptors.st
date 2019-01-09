accessing
adaptors

	^ self manager adaptors asSortedCollection: [ :a :b | a port < b port]