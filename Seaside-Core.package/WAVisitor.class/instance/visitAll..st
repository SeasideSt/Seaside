visiting
visitAll: aCollection
	aCollection do: [ :each | self visit: each ]