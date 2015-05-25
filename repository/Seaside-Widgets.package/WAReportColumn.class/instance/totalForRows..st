public
totalForRows: aCollection
	^ hasTotal
		ifFalse: [ '' ]
		ifTrue: [ formatBlock value: (aCollection inject: 0 into: [ :sum :r | sum + (self valueForRow: r) ]) ]