accessing
translator
	translator isNil ifTrue: [
		translator := GetTextTranslator availableForLocaleID: self localeId ].
	^ translator