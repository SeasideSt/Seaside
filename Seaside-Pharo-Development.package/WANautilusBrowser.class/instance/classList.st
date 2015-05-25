accessing
classList
	^ (nautilus classesInTheSelectedPackage
		collect: [ :each | each name ])
		sorted