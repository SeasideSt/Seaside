misc.
apisForHandler: handler apiKey: apiKey

	| apis |
	apis := SortedCollection sortBlock: [ :x :y | (x at: 'path') <= (y at: 'path') ].
	(self class allSelectorsBelow: WASwaggerRestfulHandler) do: [ :selector | | method |
		method := self class lookupSelector: selector.
		(GRPlatform current pragmaAt: #noAutoSwaggerInclusion in: method) ifNil: [
			(GRPlatform current pragmaAt: #path: in: method) ifNotNil: [ :pathPragma |
				((pathPragma arguments first asZnUrl) pathSegments first copyUpTo: $.) = handler ifTrue: [
					apis add: (self apiForMethod: method).
	]	]	]	].
	^ apis