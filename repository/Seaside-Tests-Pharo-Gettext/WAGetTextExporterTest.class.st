Class {
	#name : 'WAGetTextExporterTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Tests-Pharo-Gettext',
	#package : 'Seaside-Tests-Pharo-Gettext'
}

{ #category : 'helpers' }
WAGetTextExporterTest >> assertContentsOfGetTextExporter: aBlock equals: expectedString [
	
	| exporter |
	exporter := WAGetTextExporter new.
	exporter stream: String new writeStream.
	aBlock value: exporter.
	self assert: (exporter stream contents) equals: expectedString
]

{ #category : 'tests - test data' }
WAGetTextExporterTest >> fileContentsOfPOTFile [
	| today now |
	today := Date today yyyymmdd.
	now := String streamContents: [ :str | Time now print24: true showSeconds: false on: str ].
	^'msgid ""
msgstr ""
"Project-Id-Version: Pharo\n"
"POT-Creation-Date: ',today, ' ', now,'-0000\n"
"PO-Revision-Date: ',today, ' ', now,'-0000\n"
"Last-Translator: \n"
"Language-Team: \n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=utf-8\n"
"Content-Transfer-Encoding: 8bit\n"
"X-Pharo-SystemVersion: ',SystemVersion current asString,'\n"


#: WAGettextExample>>renderContentOn:
msgid "fontsize"
msgstr ""

#: WAGettextExample>>renderLocaleSelectionOn:
msgid "Select a locale below"
msgstr ""

#: WAGettextExample>>renderLocaleSelectionOn:
msgid "locale"
msgstr ""

'
]

{ #category : 'tests - test data' }
WAGetTextExporterTest >> sortedTriplets [

	^ #(
	#('WAGettextExample>>#renderContentOn:,fontsize' 'WAGettextExample>>renderContentOn:' 'fontsize') 	#('WAGettextExample>>#renderLocaleSelectionOn:,Select a locale below' 'WAGettextExample>>renderLocaleSelectionOn:' 'Select a locale below') 	#('WAGettextExample>>#renderLocaleSelectionOn:,locale' 'WAGettextExample>>renderLocaleSelectionOn:' 'locale'))
]

{ #category : 'tests - test data' }
WAGetTextExporterTest >> sortedTripletsString [

	^ '#: WAGettextExample>>renderContentOn:', String lf,
							'msgid "fontsize"', String lf,
							'msgstr ""', String lf, String cr,
							'#: WAGettextExample>>renderLocaleSelectionOn:', String lf,
							'msgid "Select a locale below"', String lf,
							'msgstr ""', String lf, String cr,
							'#: WAGettextExample>>renderLocaleSelectionOn:', String lf,
							'msgid "locale"', String lf,
							'msgstr ""', String lf, String cr.
]

{ #category : 'tests' }
WAGetTextExporterTest >> testCreateAndSortTriplets [

	| exporter result |
	exporter := WAGetTextExporter new.
	result := exporter createAndSortTriplets: (Dictionary newFrom: self translationLiteralsArrayAsRingDefinition).
	self assert: result equals: self sortedTriplets.
	
]

{ #category : 'tests' }
WAGetTextExporterTest >> testCreateStringMethodRefDictionary [

	| methodRefStringAssociations exporter expectedDictionary result |
	methodRefStringAssociations := { WAGettextExample>>#renderContentOn:->#('fontsize' 'fontsize'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderContentOn:->#('fontsize' 'fontsize'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale'). WAGettextExample>>#renderLocaleSelectionOn:->#('Select a locale below' 'locale' 'Select a locale below' 'locale') }.
	
	expectedDictionary := Dictionary newFrom: self translationLiteralsArrayAsCompiledMethod.
	exporter := WAGetTextExporter new.
	result := exporter createStringMethodRefDictionary: methodRefStringAssociations.
	
	self assert: (result at: 'fontsize') size equals: (expectedDictionary at: 'fontsize') size.
	self assert: (result at: 'Select a locale below') size equals: (expectedDictionary at: 'Select a locale below') size.
	self assert: (result at: 'locale') size equals: (expectedDictionary at: 'locale') size.
	
	self assert: result equals: expectedDictionary.
	
	
]

{ #category : 'tests' }
WAGetTextExporterTest >> testExportCatalog [
	
	| exporter translationFile |
	translationFile := FileLocator temp / 'seaside_gettext_tests.pot'.
	self deny: translationFile exists.
	exporter := WAGetTextExporter new 
		rbEnvironment: (RBPackageEnvironment packageName: 'Seaside-Gettext-Examples');
		exportFile: FileLocator temp / 'seaside_gettext_tests.pot';
		yourself.
	[ exporter exportCatalog.
	self assert: translationFile exists.
	self assert: translationFile contents withInternalLineEndings equals: self fileContentsOfPOTFile. ]
		ensure: [ translationFile ensureDelete ].
	
"Ontkoppel alles van gettextcore
Voeg ook filtering features toe voor packages en misschien categories (via RBBrowserEnvironment>>forPackageNames)."
]

{ #category : 'tests' }
WAGetTextExporterTest >> testExportPhrase [

	| expectedString exporter |
	expectedString := 'msgid "fontsize"' , String lf , 'msgstr ""', String lf, String cr.
	exporter := WAGetTextExporter new.

	"Input is 'fontsize'"
	exporter stream: OrderedCollection new writeStream.
	exporter exportPhrase: 'fontsize'.
	self assert: (String newFrom: exporter stream contents) equals: expectedString.
	exporter stream close.
	
	"Input is empty string"
	exporter stream: OrderedCollection new writeStream.
	exporter exportPhrase: ''.
	self assert: (String newFrom: exporter stream contents) equals: ''.
	exporter stream close.
]

{ #category : 'tests' }
WAGetTextExporterTest >> testExportRecordHeader [

	self
		assertContentsOfGetTextExporter: [ :exporter | exporter exportRecordHeader: 'someRecordHeader' ]
		equals: '#: someRecordHeader' , String lf
]

{ #category : 'tests' }
WAGetTextExporterTest >> testExportSortedTriplets [

	self
		assertContentsOfGetTextExporter: [ :exporter | exporter exportSortedTriplets: self sortedTriplets ]
		equals: self sortedTripletsString
]

{ #category : 'tests' }
WAGetTextExporterTest >> testExportTagMsg [
	
	| exporter stringToTest expectedString expectedString2 |
	expectedString := 'msgid ""', String lf, '"This\r"', String lf, '"is\r"', String lf, '"a msg"', String lf.
	expectedString2 := 'msgid "This is a msg"', String lf.
	exporter := WAGetTextExporter new.
	
	"ifFalse branch"
	exporter stream: OrderedCollection new writeStream.
	exporter exportTag: 'msgid' msg: 'This', String lf, 'is', String lf, 'a msg'.
	stringToTest := String newFrom: (exporter stream contents).
	self assert: stringToTest equals: expectedString.
	exporter stream close.
	
	"ifTrue branch"
	exporter stream: OrderedCollection new writeStream.
	exporter exportTag: 'msgid' msg: 'This is a msg'.
	stringToTest := String newFrom: (exporter stream contents).
	self assert: stringToTest equals: expectedString2.
	exporter stream close.






]

{ #category : 'tests' }
WAGetTextExporterTest >> testExportTagSingleLine [
	
	| exporter stringToTest expectedString |
	expectedString := 'msgid "This is some text"', String lf.
	exporter := WAGetTextExporter new.
	exporter stream: OrderedCollection new writeStream.
	exporter exportTag: 'msgid' singleLine: 'This is some text'.
	stringToTest := String newFrom: (exporter stream contents).
	self assert: stringToTest equals: expectedString.
	exporter stream close.
]

{ #category : 'tests' }
WAGetTextExporterTest >> testFormatString [
	
	| stringToTest exporter formattedString |
	stringToTest := 's\o"me ', String lf, String tab, ' string'.
	exporter := WAGetTextExporter new.
	formattedString := exporter formatString: stringToTest.
	self assert:  's\\o\"me \r\t string' equals: formattedString.
	^ formattedString.
]

{ #category : 'tests - test data' }
WAGetTextExporterTest >> translationLiteralsArrayAsCompiledMethod [

	^ {
		  ('Select a locale below' -> (Set newFrom: { (WAGettextExample >> #renderLocaleSelectionOn:) })).
		  ('fontsize' -> (Set newFrom: { (WAGettextExample >> #renderContentOn:) })).
		  ('locale' -> (Set newFrom: { (WAGettextExample >> #renderLocaleSelectionOn:) })) }
]

{ #category : 'tests - test data' }
WAGetTextExporterTest >> translationLiteralsArrayAsRingDefinition [
	"should depend on translationLiteralsArrayAsCompiledMethod"
	| result |
	result := OrderedCollection new.
	self translationLiteralsArrayAsCompiledMethod do: [ :each | | assoc |
		assoc := (each key)->OrderedCollection new.
		(each value) do: [ :method | (assoc value) add: (method asRingDefinition) ].
		assoc value: (assoc value) asArray.
		result add: assoc ].
	^ result asArray
]
