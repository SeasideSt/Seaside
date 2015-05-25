processing
handleFiltered: aRequestContext
	"Adds a Secure-Transport-Security header in case the application is transmitted over HTTPS."
	
	| request |
	request := aRequestContext request.
	request isSsl
		ifTrue: [
			aRequestContext response strictTransportSecurity: self maxAge includeSubDomains: self includeSubDomains.
			super handleFiltered: aRequestContext ]
		ifFalse: [
			| safeUrl |
			safeUrl := request url copy.
			safeUrl host: request host.
			safeUrl scheme: 'https'.
			aRequestContext redirectTo: safeUrl ]