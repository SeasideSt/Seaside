initialization
acceptsDo: aOneArgumentBlock
	| sortedKeys |
	sortedKeys := accepts keys sorted: [ :a :b | a > b ].
	sortedKeys do: [ :each |
		aOneArgumentBlock value: (accepts allAt: each) ]