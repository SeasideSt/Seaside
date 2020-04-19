private
remoteAddressFromRequest: aRequest
	| result |
	result := aRequest forwardedFor ifNil:[ aRequest remoteAddress ].
	remoteAddress ifNil:[ remoteAddress := result ].
	^ result