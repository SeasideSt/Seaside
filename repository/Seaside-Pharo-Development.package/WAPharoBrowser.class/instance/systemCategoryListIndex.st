accessing
systemCategoryListIndex
	^ (self packages
		sorted: [ :a :b | a packageName <= b packageName ])
		indexOf: selectedPackage