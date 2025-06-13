*seaside-pharo-welcome
seasideSetAuthorName: anAuthorName

	SystemVersion current major >= 13 ifTrue:[ ^ self error: 'Author does not exist anymore.' ].
	(Smalltalk at: #Author) fullName: anAuthorName