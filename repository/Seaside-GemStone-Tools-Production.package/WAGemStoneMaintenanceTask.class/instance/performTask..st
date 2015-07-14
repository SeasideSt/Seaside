execution
performTask: aCount

	(aCount \\ self frequency) = 0
		ifTrue: [ self valuable value: self ].