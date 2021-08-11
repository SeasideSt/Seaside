accessing-urls
sameOriginDataUrl

	| parts host crossOrigin |
	parts := self requestContext request host findTokens: ':'.
	host := parts first.
	crossOrigin := parts last asInteger == WACORSResourceExample originAdaptorPort.
	^ self buildDataUrlFor: host crossOrigin: crossOrigin not