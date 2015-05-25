private
assert: anArray at: anInteger main: aMainString sub: aSubString quality: aFloat
	| value mimeType |
	value := (anArray at: anInteger).
	self assert: (value isKindOf: WAQualifiedValue).
	self assert: value quality = aFloat.
	
	mimeType := value value.
	self assert: (mimeType isKindOf: WAMimeType).
	self assert: (mimeType main = aMainString).
	self assert: (mimeType sub = aSubString)