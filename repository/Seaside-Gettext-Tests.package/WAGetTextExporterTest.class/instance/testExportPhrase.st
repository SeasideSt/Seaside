tests
testExportPhrase

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