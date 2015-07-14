private
remoteAddressFromRequest: aRequest
	remoteAddress ifNil: [
		remoteAddress := aRequest
			headerAt: 'x-forwarded-for'
			ifAbsent: [ aRequest remoteAddress ]	].
	^ aRequest remoteAddress