private
loadTranslationFilesFrom: aPathString
	WAGetTextTranslator
		createTranslatorFor: 'seaside-gettext-example'
		fromFilesIn: aPathString