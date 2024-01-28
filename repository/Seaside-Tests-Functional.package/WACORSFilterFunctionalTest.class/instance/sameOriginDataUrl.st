accessing-urls
sameOriginDataUrl

	| parts host port |
	parts := self requestContext request host substrings: ':'.
	host := parts first.
	port := parts last greaseInteger.
	^ self buildDataUrlFor: host port: port