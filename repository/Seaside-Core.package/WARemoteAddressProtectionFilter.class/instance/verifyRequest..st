testing
verifyRequest: aRequest
	^ (self remoteAddressFromRequest: aRequest) = self remoteAddress