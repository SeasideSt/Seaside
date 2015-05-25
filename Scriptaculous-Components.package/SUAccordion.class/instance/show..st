delegation
show: anElement
	self visible addLast: anElement.
	self maxVisible isNil ifFalse: [
		[ self maxVisible < self visible size ]
			whileTrue: [ self hide: self visible first ] ]