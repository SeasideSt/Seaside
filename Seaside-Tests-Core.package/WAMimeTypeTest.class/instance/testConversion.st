tests
testConversion
	| mimeType |
	mimeType := 'image/jpeg' seasideMimeType.
	self assert: (mimeType isKindOf: WAMimeType).
	self assert: mimeType main = 'image'.
	self assert: mimeType sub = 'jpeg'.
	self assert: mimeType parameters isEmpty.
	self assert: mimeType greaseString = 'image/jpeg'.
	mimeType := mimeType seasideMimeType.
	self assert: (mimeType isKindOf: WAMimeType)