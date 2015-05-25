values
at: aSymbol put: anObject
	"It would be faster to simply add the value to the dictionary and
	implement #takeValue:forAttribute: in terms of this method, but
	config options are set only rarely and this ensures you are setting
	a value for an attribute that actually exists."

	^ self takeValue: anObject forAttribute: (self attributeAt: aSymbol)