accessing
classList
	^ (self classesInTheSelectedPackage
		collect: [ :each | each name ])
		sorted