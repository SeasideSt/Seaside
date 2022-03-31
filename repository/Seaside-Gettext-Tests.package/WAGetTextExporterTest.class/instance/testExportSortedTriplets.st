tests
testExportSortedTriplets

	self
		assertContentsOfGetTextExporter: [ :exporter | exporter exportSortedTriplets: self sortedTriplets ]
		equals: self sortedTripletsString