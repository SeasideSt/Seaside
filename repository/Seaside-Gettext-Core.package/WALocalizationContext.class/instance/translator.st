accessing
translator
	translator ifNil: [
		translator := WAGetTextTranslator translatorFor: self application gettextApplicationName ].
	^ translator