accessing
systemCategoryListIndex: anInteger
	selectedPackage := ((self packages
		sorted: [ :a :b | (self packageNameOf: a) <= (self packageNameOf: b) ]) at: anInteger).
	selectedClass := nil.
	self clearMessageAndProtoclSelection.
	self changed: #systemCategoryListIndex