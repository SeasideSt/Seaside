translators registry
addTranslatorFor: anApplicationName fromFiles: aCollectionOfMOFiles
	"Create and register a translator for the named application with given gettext translation files"
	self 
		addTranslator: (self newFromMOFiles: aCollectionOfMOFiles)
		for: anApplicationName