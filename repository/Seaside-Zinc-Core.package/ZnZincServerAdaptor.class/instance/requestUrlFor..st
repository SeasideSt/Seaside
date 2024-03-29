converting-request
requestUrlFor: aZincRequest

	| zincUrl seasideUrl |
	zincUrl := aZincRequest url.
	seasideUrl := WAUrl new
		              scheme: zincUrl schemeOrDefault greaseString;
		              host: zincUrl host;
		              port: zincUrl port;
		              fragment: zincUrl fragment.
	zincUrl hasPath ifTrue: [
		zincUrl isDirectoryPath
			ifTrue: [ 
				"last path segment is $/ or #/"
				zincUrl pathSegments allButLast do: [ :each | seasideUrl rawAddToPath: each ].
				"GemStone/S currently does not support #allButLastDo:"
				seasideUrl slash: true ]
			ifFalse: [ seasideUrl rawAddAllToPath: zincUrl pathSegments ] ].
	zincUrl queryDo: [ :key :value | seasideUrl addField: key value: value ].
	^ seasideUrl