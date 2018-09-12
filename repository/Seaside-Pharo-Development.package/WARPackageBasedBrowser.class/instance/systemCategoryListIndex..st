accessing
systemCategoryListIndex: anInteger
	selectedPackage := ((self packages
		sorted: [ :a :b | a packageName <= b packageName ]) at: anInteger).
	selectedClass := nil.
	self clearMessageAndProtoclSelection.
	self changed: #systemCategoryListIndex