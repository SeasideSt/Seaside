converting
pathString
	"Answer the path converted to a string."
	self greaseDeprecatedApi: 'WAUrl>>#pathString' details: 'Use either #pathStringUnencoded or #pathStringEncodedWith:.'. 
	^ String streamContents: [ :stream | 
		| document |
		document := WAHtmlDocument on: stream.
		self encodePathOn: document ]