adding
rawAddAllToPath: aCollectionOfStrings
	"Add a collection of strings to the path. If an element contains $/ it is not split into multiple elements."
	
	aCollectionOfStrings do: [ :each | self rawAddToPath: each ]