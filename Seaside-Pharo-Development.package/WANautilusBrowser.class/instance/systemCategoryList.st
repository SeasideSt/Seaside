accessing
systemCategoryList
	^ (nautilus packages
		collect: [ :each | each packageName ])
		sorted