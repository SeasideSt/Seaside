description
listingClasses
	^ WAFileHandlerListing allSubclasses asSortedCollection: [ :a :b | a name <= b name ]