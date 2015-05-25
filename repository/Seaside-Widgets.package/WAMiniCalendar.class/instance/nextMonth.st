action
nextMonth
	self monthIndex = 12
		ifTrue: [ self monthIndex: 1; year: self year + 1 ]
		ifFalse: [ self monthIndex: self monthIndex + 1 ]