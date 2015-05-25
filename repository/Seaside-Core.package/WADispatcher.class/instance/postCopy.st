copying
postCopy
	super postCopy.
	handlers := handlers valuesCollect: [ :each | each copy setParent: self; yourself ]