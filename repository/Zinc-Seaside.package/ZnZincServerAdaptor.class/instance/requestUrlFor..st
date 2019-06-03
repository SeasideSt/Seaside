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
		zincUrl pathSegments do: [ :each |
			| pathSegmentAsString |
			pathSegmentAsString := each greaseString.
			pathSegmentAsString = '/' ifFalse: [ seasideUrl addToPath: pathSegmentAsString ] ].
		seasideUrl slash: zincUrl isDirectoryPath ].
	zincUrl queryDo: [ :key :value |
		seasideUrl addField: key value: value ].
	^ seasideUrl