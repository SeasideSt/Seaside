tests
testExportRecordHeader

	self
		assertContentsOfGetTextExporter: [ :exporter | exporter exportRecordHeader: 'someRecordHeader' ]
		equals: '#: someRecordHeader' , String lf