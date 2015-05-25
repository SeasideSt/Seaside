testing
verifyRequest: aRequest
	^ self authenticator verifyPassword: aRequest password forUser: aRequest user