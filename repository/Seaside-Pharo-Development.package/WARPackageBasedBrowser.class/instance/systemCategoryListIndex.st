accessing
systemCategoryListIndex
	^ (self packages
		sorted: [ :a :b | (self packageNameOf: a) <= (self packageNameOf: b) ])
		indexOf: selectedPackage