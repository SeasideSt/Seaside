testing
isBinary
	"answers whether the contents of a document of the receiving mime type are binary"
	self main = 'text' ifTrue: [ ^ false ].
	self main = 'application'
		ifTrue: [
			"application/json is text"
			(#('json' 'x-www-form-urlencoded') includes: self sub) ifTrue: [ ^ false ] ].
	GRPlatform subStringsIn: self sub splitBy: $+ do: [ :each |
		"application/(x-)javascript and application/xml are text"
		(#('x-javascript' 'javascript' 'xml') includes: each)
			ifTrue: [ ^ false ] ].
	^ true