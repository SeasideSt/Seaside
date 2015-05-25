private
assert: anArray at: anInteger language: aLanguageString country: aCountryString quality: aFloat
	| value mimeType |
	value := (anArray at: anInteger).
	self assert: (value isKindOf: WAQualifiedValue).
	self assert: value quality = aFloat.
	
	mimeType := value value.
	self assert: (mimeType isKindOf: WALocale).
	self assert: (mimeType language = aLanguageString).
	self assert: (mimeType country = aCountryString)