accessing-urls
crossOriginDataUrl

	| parts host port |
	parts := self requestContext request host findTokens: ':'.
	host := parts first.
	port := parts last asInteger.
	self assert: port ~= WACORSResourceExample corsAdaptorPort.
	^ self buildDataUrlFor: host port: WACORSResourceExample corsAdaptorPort