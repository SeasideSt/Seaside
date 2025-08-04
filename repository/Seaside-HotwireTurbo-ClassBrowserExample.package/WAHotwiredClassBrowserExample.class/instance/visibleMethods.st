accessing
visibleMethods

	self selectedClass ifNil: [ ^ { } ].
	^ self selectedMethodCategory
		ifNil:[ self environment selectorsForClass: self selectedClass ]
		ifNotNil:[ self environment selectorsFor: self selectedMethodCategory in: self selectedClass ]