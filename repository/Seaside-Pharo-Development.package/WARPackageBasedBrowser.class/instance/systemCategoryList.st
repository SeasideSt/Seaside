accessing
systemCategoryList

	^ (self packages collect: [ :each | (self packageNameOf: each) ]) sorted