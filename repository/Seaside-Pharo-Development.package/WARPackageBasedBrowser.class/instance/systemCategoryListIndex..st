accessing
systemCategoryListIndex: anInteger
	selectedPackage := ((self packages
		sorted: [ :a :b | a name <= b name ]) at: anInteger).
	selectedClass := nil.
	self clearMessageAndProtoclSelection.
	self changed: #systemCategoryListIndex