accessing
translator
	translator ifNil: [
		translator := WAGetTextTranslator availableForLocaleID: self localeId ].
	^ translator