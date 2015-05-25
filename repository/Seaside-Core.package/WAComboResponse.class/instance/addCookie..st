accessing-cookies
addCookie: aCookie
	"Add aCookie to the receiver. Raise an error if the response is committed."

	self committedCheck.
	^ super addCookie: aCookie