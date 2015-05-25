accessing
systemCategoryListIndex
	^ (nautilus packages
		sorted: [ :a :b | a packageName <= b packageName ])
		indexOf: nautilus selectedPackage