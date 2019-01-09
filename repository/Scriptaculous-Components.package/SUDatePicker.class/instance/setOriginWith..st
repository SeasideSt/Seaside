public
setOriginWith: aString
	| anArray |
	anArray := GRPlatform subStringsIn: aString splitBy: $,
		collect: [ :each | each select: [ :char | char isDigit ] ].
	anArray size > 1
		ifTrue: [ self origin: (Point x: (anArray at: 1) asNumber y: (anArray at: 2) asNumber + 20) ]