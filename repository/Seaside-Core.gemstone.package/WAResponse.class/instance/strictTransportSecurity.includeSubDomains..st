convenience-headers
strictTransportSecurity: maxAge includeSubDomains: aBoolean
	"Implements Strict Transport Security (STS).
		http://lists.w3.org/Archives/Public/www-archive/2009Dec/att-0048/draft-hodges-strict-transport-sec-06.plain.html
	Use only over secure connections (HTTPS)."
	
	self
		headerAt: 'Strict-Transport-Security'
		put: 'max-age=', maxAge greaseString,
			(aBoolean ifTrue: [ '; includeSubDomains' ] ifFalse: [ '' ])