converting
requestAddressFor: aZincRequest
	^ aZincRequest  headers
		at: ZnConstants remoteAddressHeader 
		ifAbsent: [ nil ]