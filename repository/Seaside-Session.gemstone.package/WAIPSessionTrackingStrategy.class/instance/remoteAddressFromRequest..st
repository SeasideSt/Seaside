private
remoteAddressFromRequest: aRequest
	^ aRequest
			headerAt: 'x-forwarded-for'
			ifAbsent: [
				aRequest
					headerAt: 'forwarded-for'
					ifAbsent: [ aRequest remoteAddress ] ]