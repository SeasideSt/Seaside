tests
testExportTagSingleLine
	
	| exporter stringToTest expectedString |
	expectedString := 'msgid "This is some text"', String lf.
	exporter := WAGetTextExporter new.
	exporter stream: OrderedCollection new writeStream.
	exporter exportTag: 'msgid' singleLine: 'This is some text'.
	stringToTest := String newFrom: (exporter stream contents).
	self assert: stringToTest equals: expectedString.
	exporter stream close.