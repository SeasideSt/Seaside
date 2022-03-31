tests
testCreateAndSortTriplets

	| exporter  result |
	exporter := WAGetTextExporter new.
	result := exporter createAndSortTriplets: (Dictionary newFrom: self translationLiteralsArrayAsRingDefinition).
	self assert: result equals: self sortedTriplets.
	