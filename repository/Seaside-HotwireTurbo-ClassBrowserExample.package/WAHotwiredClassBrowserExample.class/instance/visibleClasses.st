accessing
visibleClasses

	self selectedPackage ifNil: [ ^ { } ].
	^ (self environment classesInPackage: self selectedPackage) sorted: [ :a :b | a name <= b name ]