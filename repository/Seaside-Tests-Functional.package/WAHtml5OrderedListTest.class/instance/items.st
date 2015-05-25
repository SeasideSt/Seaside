accessing
items
	^ #(
		'If Request-URI is an absoluteURI, the host is part of the Request-URI. Any Host header field value in the request MUST be ignored.'
		'If the Request-URI is not an absoluteURI, and the request includes a Host header field, the host is determined by the Host header field value.'
		'If the host as determined by rule 1 or 2 is not a valid host on the server, the response MUST be a 400 (Bad Request) error message.'
	)