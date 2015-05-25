enumerating
allAt: aKey
	^ Array streamContents: [ :stream |
		delegates do: [ :each | stream nextPutAll: (each allAt: aKey) ] ]