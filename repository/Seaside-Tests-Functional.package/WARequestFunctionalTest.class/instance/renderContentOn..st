rendering
renderContentOn: html
	| request |
	html paragraph: 'This tests whether the server delivers the remote address correctly and headers can be parsed correctly.'.
	request := self requestContext request.
	html definitionList: [
		self renderRemoteAddressFor: request on: html.
		self renderSslSessionIdFor: request on: html.
		self renderAcceptFor: request on: html.
		self renderAcceptCharsetFor: request on: html.
		self renderAcceptEncodingFor: request on: html.
		self renderAcceptLanguageFor: request on: html ]