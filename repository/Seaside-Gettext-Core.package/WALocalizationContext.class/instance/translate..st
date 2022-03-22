translating
translate: aString
	^ self translator
		translate: aString
		fromFiles: self languageFiles