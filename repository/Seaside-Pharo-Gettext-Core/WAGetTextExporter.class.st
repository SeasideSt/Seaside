Class {
	#name : #WAGetTextExporter,
	#superclass : #GetTextExporter,
	#category : 'Seaside-Pharo-Gettext-Core'
}

{ #category : #exporting }
WAGetTextExporter >> appendStringReceiversInto: domains [
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
]

{ #category : #exporting }
WAGetTextExporter >> appendTranslations: domains [
	"The Seaside translation messages are fixed"
	self appendStringReceiversInto: domains
]

{ #category : #exporting }
WAGetTextExporter >> appendTranslations: domains for: someSelectors [
	"The Seaside translation messages are fixed"
	self appendStringReceiversInto: domains
]
