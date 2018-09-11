initialization
initialize
	super initialize.
	
	"According to https://tools.ietf.org/html/rfc6265#section-5.1.4
	user-agents must use '/' as the default path (see class comment)"
	path := '/'.
	pathEncoded := '/'