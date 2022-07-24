instance creation
createTranslatorFor: anApplicationName fromFilesIn: aDirectoryPathString
	"Create and register a translator for the named application with gettext translation files located in the given directory.
	The argument directory is the top directory of the Gettext translation filestructure."
	TranslatorRegistry 
		at: anApplicationName
		put: (self newFromMOFilesIn: aDirectoryPathString forName: anApplicationName)