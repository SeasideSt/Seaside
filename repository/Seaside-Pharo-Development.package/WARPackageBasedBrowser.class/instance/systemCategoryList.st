accessing
systemCategoryList
	^ (self packages
		collect: [ :each | each name ])
		sorted