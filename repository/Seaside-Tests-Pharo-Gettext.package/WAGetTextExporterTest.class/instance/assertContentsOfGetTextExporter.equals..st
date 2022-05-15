helpers
assertContentsOfGetTextExporter: aBlock equals: expectedString
	
	| exporter |
	exporter := WAGetTextExporter new.
	exporter stream: String new writeStream.
	aBlock value: exporter.
	self assert: (exporter stream contents) equals: expectedString