accessing
visibleMethodCategories

	self selectedClass ifNil: [ ^ { } ].
	^ (self environment protocolsFor: self selectedClass) sorted: [ :a :b | a name <= b name ]