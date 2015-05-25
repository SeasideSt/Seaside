private
assert: anArray at: anInteger charset: aString quality: aFloat
	| value |
	value := (anArray at: anInteger).
	self assert: (value isKindOf: WAQualifiedValue).
	self assert: value quality = aFloat.
	
	self assert: value value = aString