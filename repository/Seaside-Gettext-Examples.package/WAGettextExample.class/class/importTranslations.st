localization
importTranslations
	"It could be that your translation files are somewhere else, feel free to alter this path"
	WAGetTextTranslator
		createTranslatorFor: 'seaside-gettext-example'
		fromFiles: (FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'Seaside' / 'seaside-gettext-example' / 'locale') asFileReference