accessing-urls
crossOriginDataUrl

	| parts host port |
	parts := self requestContext request host substrings: ':'.
	host := parts first.
	port := parts last greaseInteger.
	self assert: port ~= WACORSResourceExample corsAdaptorPort.
	^ self buildDataUrlFor: host port: WACORSResourceExample corsAdaptorPort