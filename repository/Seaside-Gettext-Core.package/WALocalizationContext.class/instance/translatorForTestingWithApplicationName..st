private
translatorForTestingWithApplicationName: anApplicationName
	translator := WAGetTextTranslator translatorFor: anApplicationName.
	^ translator