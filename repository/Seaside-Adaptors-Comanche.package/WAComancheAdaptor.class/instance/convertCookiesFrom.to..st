private
convertCookiesFrom: aWAResponse to: aKomResponse
	| cookies |
	cookies := aWAResponse cookies.
	cookies isEmpty ifTrue: [ ^ self ].

	cookies do: [ :each |
		"user Seaside serialization for full features instead of Kom
		this is quite evil code that works only because it knows the exact implemation of this method in Kom"
		aKomResponse
			setCookieName: each key
			value: each oldNetscapeStringWithoutKey
			path: nil ].
		
	aKomResponse
		fieldAt: 'Set-Cookie2'
		put: (WACookie combine: cookies using: [ :each | each rfc2965String ])