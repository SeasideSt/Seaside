utilities
jsonFromString: aString
	"Parse a JSON string using the native JSON.parse function."

	^ (JSJson context: self renderContext) parse: aString