private
remoteAddressFromRequest: aRequest
	| result |
	result := aRequest forwarded ifNil:[ aRequest remoteAddress ].
	remoteAddress ifNil:[ remoteAddress := result ].
	^ result