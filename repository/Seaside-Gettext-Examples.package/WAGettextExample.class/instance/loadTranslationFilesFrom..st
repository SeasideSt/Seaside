private
loadTranslationFilesFrom: aPath
	WAGetTextTranslator
		createTranslatorFor: 'seaside-gettext-example'
		fromFiles: aPath asFileReference 