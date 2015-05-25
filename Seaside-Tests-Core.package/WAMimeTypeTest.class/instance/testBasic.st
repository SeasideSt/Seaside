tests
testBasic
	| mimeType |
	mimeType := WAMimeType fromString: 'image/jpeg'.
	self assert: mimeType main = 'image'.
	self assert: mimeType sub = 'jpeg'.
	self assert: mimeType parameters isEmpty.
	self assert: mimeType greaseString = 'image/jpeg'