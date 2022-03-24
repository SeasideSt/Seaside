translators
createTranslatorFor: anApplicationName fromFiles: aFileReference
	Translators 
		at: anApplicationName
		put: (self newFromMOFiles: aFileReference forName: anApplicationName)