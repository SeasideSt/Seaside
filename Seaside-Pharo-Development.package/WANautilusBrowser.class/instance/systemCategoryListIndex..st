accessing
systemCategoryListIndex: anInteger
	nautilus selectedPackage: ((nautilus packages
		sorted: [ :a :b | a packageName <= b packageName ]) at: anInteger).
	nautilus selectedClass: nil.
	self clearMessageAndProtoclSelection.
	self changed: #systemCategoryListIndex