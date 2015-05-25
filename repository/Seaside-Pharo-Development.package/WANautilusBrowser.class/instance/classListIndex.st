accessing
classListIndex
	^ (self classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		indexOf: nautilus selectedClass