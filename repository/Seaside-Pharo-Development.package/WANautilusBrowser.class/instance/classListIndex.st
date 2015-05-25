accessing
classListIndex
	^ (nautilus classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		indexOf: nautilus selectedClass