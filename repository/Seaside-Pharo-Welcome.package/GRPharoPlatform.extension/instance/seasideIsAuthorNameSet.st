*seaside-pharo-welcome
seasideIsAuthorNameSet

	SystemVersion current major >= 13 ifTrue:[ ^ true. "Author does not exist anymore" ].
	^ (Smalltalk at: #Author) fullNamePerSe isEmptyOrNil not