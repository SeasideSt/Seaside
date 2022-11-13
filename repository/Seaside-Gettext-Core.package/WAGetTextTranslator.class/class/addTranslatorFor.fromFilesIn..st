translators registry
addTranslatorFor: anApplicationName fromFilesIn: aDirectoryPathString
	"Create and register a translator for the named application with gettext translation files located in the given directory.
	The argument directory is the top directory of the Gettext translation filestructure."
	self 
		addTranslator: (self newFromMOFilesIn: aDirectoryPathString forName: anApplicationName)
		for: anApplicationName