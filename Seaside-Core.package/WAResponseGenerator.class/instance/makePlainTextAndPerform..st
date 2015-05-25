private
makePlainTextAndPerform: aSelector
	"Changesthe content type to text/plain and then performs the selector if possible."
	self ifResetPossible: [
		| mimeType response |
		response := self response.
		response perform: aSelector.
		mimeType := WAMimeType textPlain.
		mimeType charset: self requestContext charSet.
		response contentType: mimeType ]