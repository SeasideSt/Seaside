generation
authenticate: aString
	"Asks for authentication to the domain aString."

	self ifResetPossible: [
		self response basicAuthenticationRealm: aString ]