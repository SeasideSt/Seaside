private
baseURLString

	| baseURL |
	baseURL := self url asZnUrl.
	baseURL host ifNil: [
		baseURL port: nil.
		baseURL scheme: self serverProtocol.
		baseURL parseAuthority: self requestContext request host greaseString readStream.
	].
	^ baseURL asStringOrText