copying
postCopy
	super postCopy.
	filter := filter copy.
	self setFilter: (self filter copyTo: self).
	configuration := configuration copy.
	parent := nil