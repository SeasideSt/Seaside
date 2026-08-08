requests
ensureAuthorInitialsWith: aOneArgumentBlock
	"Makes sure the author initials for the image are set.
	aOneArgumentBlock is called with a question string as an argument when the initials are not set, it answers the initials"
	
	Utilities authorInitialsPerSe isEmpty ifTrue: [
		Utilities setAuthorInitials: (aOneArgumentBlock value: 'Please enter your initials:') ]