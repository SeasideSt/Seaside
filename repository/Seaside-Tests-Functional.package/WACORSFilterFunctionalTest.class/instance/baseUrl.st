accessing-urls
baseUrl

	| parts url |
	parts := self requestContext request host substrings: ':'.
	url := self requestContext request url withoutSeasideQueryFields path: OrderedCollection new.
	url host: parts first.
	parts size > 1 ifTrue: [ url port: (Integer readFrom: parts last) ].

	^ url