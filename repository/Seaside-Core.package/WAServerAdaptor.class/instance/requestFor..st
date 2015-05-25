converting
requestFor: aNativeRequest
	"Answer a request object for aNativeRequest."

	^ (WARequest
		method: (self requestMethodFor: aNativeRequest)
		uri: (self requestUrlFor: aNativeRequest)
		version: (self requestVersionFor: aNativeRequest))
			setHeaders: (self requestHeadersFor: aNativeRequest);
			setBody: (self requestBodyFor: aNativeRequest);
			setPostFields: (self requestFieldsFor: aNativeRequest);
			setCookies: (self requestCookiesFor: aNativeRequest);
			setRemoteAddress: (self requestAddressFor: aNativeRequest);
			setSslSessionId: (self sslSessionIdFor: aNativeRequest);
			yourself