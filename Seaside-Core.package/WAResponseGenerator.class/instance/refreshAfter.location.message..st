generation
refreshAfter: aDuration location: aUrl message: aString 
	"Show aString for aDuration, then redirect to aUrl."
	self ifResetPossible: [
		| mimeType |
		mimeType := WAMimeType textPlain.
		mimeType charSet: self request charSet.
		self response
			contentType: mimeType;
			refreshAfter: aDuration
				location: aUrl
				message: aString , (String with: Character cr) , 'You are being redirected to ' , aUrl greaseString ]