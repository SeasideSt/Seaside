tests
testCreateAndSortTriplets

	| exporter  result |
	exporter := WAGetTextExporter new.
	result := exporter createAndSortTriplets: self translationLiteralsDict.
	self assert: result equals: self sortedTriplets.
	