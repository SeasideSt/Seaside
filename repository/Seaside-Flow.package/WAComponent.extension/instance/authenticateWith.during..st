*Seaside-Flow-filters
authenticateWith: anAuthenticator during: aBlock
	"Authenticate calls during the evaluation of aBlock."
	
	self 
		filterWith: (WAAuthenticationFilter new
			authenticator: anAuthenticator;
			yourself)
		during: aBlock