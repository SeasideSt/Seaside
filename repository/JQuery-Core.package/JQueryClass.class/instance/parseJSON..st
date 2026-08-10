utilities
parseJSON: aString
	"Compatibility wrapper for the old jQuery parseJSON API. Prefer native JSON.parse(...) instead."
	self 
		greaseDeprecatedApi: 'JQueryClass>>#parseJSON'
		details: 'Deprecated in jQuery 3. Prefer native JSON.parse(...).'.
	
	^ (JSJson context: self renderContext) parse: aString