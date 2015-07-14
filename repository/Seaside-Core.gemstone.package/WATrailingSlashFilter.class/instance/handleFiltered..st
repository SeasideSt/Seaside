processing
handleFiltered: aRequestContext
	(self shouldRedirect: aRequestContext)
		ifFalse: [ super handleFiltered: aRequestContext ]
		ifTrue: [ self redirectWithTrailingSlash: aRequestContext ]