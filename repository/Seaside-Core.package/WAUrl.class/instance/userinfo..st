accessing
userinfo: aString
	"Colons in userinfo must be encoded. The only exception (now deprecated by RFC 3986)
	is a single colon separating a password from the rest of the user information. Since
	we can't tell the difference here, we assume that any colons should be encoded. If
	you want to specify a (deprecated) password, use #user: and #password:."
	
	user := aString.
	password := nil