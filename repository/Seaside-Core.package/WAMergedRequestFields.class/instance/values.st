enumerating
values
	^ Array streamContents: [ :stream |
		delegates do: [ :each | stream nextPutAll: each values ] ]