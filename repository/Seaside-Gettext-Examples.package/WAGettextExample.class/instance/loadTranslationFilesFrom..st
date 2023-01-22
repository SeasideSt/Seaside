private
loadTranslationFilesFrom: aPathString
	WAGetTextTranslator
		addTranslatorFor: 'seaside-gettext-example'
		fromFilesIn: aPathString