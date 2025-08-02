handling
addAllowsCredentialsHeaderTo: aResponse

	allowsCredentials ifNotNil: [
		aResponse
			headerAt: 'Access-Control-Allow-Credentials'
			put: allowsCredentials greaseString ]