tests
testExportTagMsg
	
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





