testing
produces: aCollectionOfAccept
	^ aCollectionOfAccept anySatisfy: [ :each | produces matches: each value ]