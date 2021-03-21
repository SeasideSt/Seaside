accessing
translator
	translator ifNil: [
		translator := GetTextTranslator availableForLocaleID: self localeId ].
	^ translator