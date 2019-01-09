private
convertCookiesFrom: aWAResponse to: aKomResponse
	| cookies |
	cookies := aWAResponse cookies.
	cookies isEmpty ifTrue: [ ^ self ].

	cookies do: [ :each |
		"user Seaside serialization for full features instead of Kom
		this is quite evil code that works only because it knows the exact implementation of this method in Kom"
		aKomResponse
			setCookieName: each key
			value: each rfc6265StringWithoutKey
			path: nil ]