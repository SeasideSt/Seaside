converting
requestUrlFor: aZincRequest
	| zincUrl seasideUrl |
	zincUrl := aZincRequest url.
	(seasideUrl := WAUrl new)
		scheme: zincUrl scheme greaseString;
		host: zincUrl host;
		port: zincUrl port;
		fragment: zincUrl fragment.
	zincUrl hasPath ifTrue: [
		zincUrl isDirectoryPath
			ifTrue: [ "last path segment is $/ or #/"
					zincUrl pathSegments
						allButLastDo: [ :each | seasideUrl addToPath: each ].
					seasideUrl slash: true ]
			ifFalse: [ seasideUrl addAllToPath: zincUrl pathSegments ] ].
	zincUrl
		queryDo: [ :key :value | seasideUrl addField: key value: value ].
	^ seasideUrl