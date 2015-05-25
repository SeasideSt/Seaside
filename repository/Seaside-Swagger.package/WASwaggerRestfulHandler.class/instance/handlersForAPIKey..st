misc.
handlersForAPIKey: apiKey

	| handlers |
	handlers := Set new.
	(self class allSelectorsBelow: WASwaggerRestfulHandler) do: [ :selector | | method |
		method := self class lookupSelector: selector.
		(GRPlatform current pragmaAt: #noAutoSwaggerInclusion in: method) ifNil: [
			(GRPlatform current pragmaAt: #path: in: method) ifNotNil: [ :pathPragma |
				(pathPragma arguments first beginsWith: '/') & ((pathPragma arguments first includesSubString: 'api_key') = apiKey notNil) ifTrue: [
					handlers add: ((pathPragma arguments first asZnUrl) pathSegments first copyUpTo: $.).
				].
			].
		].
	].
	^ handlers