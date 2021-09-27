accessing-urls
sameOriginDataUrl

	| parts host port |
	parts := self requestContext request host findTokens: ':'.
	host := parts first.
	port := parts last asInteger.
	^ self buildDataUrlFor: host port: port