accessing
classListIndex: anInteger
	nautilus selectedClass: ((nautilus classesInTheSelectedPackage
		sorted: [ :a :b | a name <= b name ])
		at: anInteger).
	self clearMessageAndProtoclSelection.
	self changed: #classListIndex