attributes-language
language: aString
	"Set the language code."

	self attributes
		at: 'lang' put: aString;
		at: 'xml:lang' put: aString