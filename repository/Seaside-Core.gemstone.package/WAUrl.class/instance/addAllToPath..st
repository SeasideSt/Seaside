adding
addAllToPath: aCollectionOfStrings
	"Add a collection of strings to the path."
	
	aCollectionOfStrings do: [ :each | self addToPath: each ]