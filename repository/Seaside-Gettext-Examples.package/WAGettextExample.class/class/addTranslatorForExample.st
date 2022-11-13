localization
addTranslatorForExample

	| localeIds moFiles |
	localeIds := #( #nl_BE #fr #de_CH ) collect: [ :str | (WALocale fromString: str) localeId ].
	moFiles := localeIds collect: [ :localeId | 
		           | contents |
		           contents := (WAGettextTestingFileLibrary new perform:
											(WAGettextTestingFileLibrary asSelector: localeId , '.mo')) contents value.
		           WAMOFile
			           fromStream: contents readStream
			           localeId: localeId ].
	
	WAGetTextTranslator addTranslatorFor: 'seaside-gettext-example' fromFiles: moFiles