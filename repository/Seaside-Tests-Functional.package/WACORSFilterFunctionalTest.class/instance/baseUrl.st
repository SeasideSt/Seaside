accessing-urls
baseUrl

	| parts url |
	parts := $: split: self requestContext request host.
	url := self requestContext request url withoutSeasideQueryFields path: OrderedCollection new.
	url host: parts first.
	parts size > 1 ifTrue: [ url port: (Integer readFrom: parts last) ].

	^ url