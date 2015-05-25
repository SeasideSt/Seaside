action
previousMonth
	self monthIndex = 1
		ifTrue: [ self monthIndex: 12; year: self year - 1 ]
		ifFalse: [ self monthIndex: self monthIndex - 1 ]
