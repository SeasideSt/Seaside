handling
addAllowsCredentialsHeaderTo: aResponse

	(allowsCredentials notNil and: [ allowsCredentials ]) ifTrue: [
		aResponse
			headerAt: 'Access-Control-Allow-Credentials'
			put: allowsCredentials greaseString ]