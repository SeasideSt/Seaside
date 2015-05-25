exporting
appendStringReceiversInto: domains
	| found |
	
	found := WATranslatedArgumentsFinder new translatedArguments.
	found do: [ :assoc |
		| literals domainName methodReference keywords |
		methodReference := assoc key.
		keywords := assoc value.
		domainName := self getTextDomainForClassCategory: methodReference package name.
		literals := domains at: domainName ifAbsentPut: [ Dictionary new ].
		keywords do: [ :literal |
			| references |
			references := literals at: literal ifAbsentPut: [ OrderedCollection new ].
			references add: methodReference ] ]. 