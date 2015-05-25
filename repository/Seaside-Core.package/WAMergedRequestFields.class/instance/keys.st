enumerating
keys
	^ Array streamContents: [ :stream |
		delegates do: [ :each | stream nextPutAll: each keys ] ]