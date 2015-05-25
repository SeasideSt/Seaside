enumerating
keysAndValuesDo: aBlock
	delegates do: [ :each | each keysAndValuesDo: aBlock ]