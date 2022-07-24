translators registry
translatorFor: anApplicationName
	^ TranslatorRegistry at: anApplicationName ifAbsent: [ nil ]