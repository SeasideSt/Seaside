translators registry
addTranslator: aTranslator for: anApplicationName
	"Register translator for the named application"
	TranslatorRegistry 
		at: anApplicationName
		put: aTranslator