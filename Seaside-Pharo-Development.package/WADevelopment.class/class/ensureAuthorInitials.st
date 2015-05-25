requests
ensureAuthorInitials
	"Makes sure the author initials for the image are set."

	^ self ensureAuthorInitialsWith: [ :question | self request: question ]