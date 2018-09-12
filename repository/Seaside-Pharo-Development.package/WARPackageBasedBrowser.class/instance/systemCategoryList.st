accessing
systemCategoryList
	^ (self packages
		collect: [ :each | each packageName ])
		sorted