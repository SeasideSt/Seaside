private
shouldRedirect
	"This should probably be made configurable, but for backwards compatibility with Seaside 3.0,
	where we do not redirect when you enter a session, we return false."
	
	^ false