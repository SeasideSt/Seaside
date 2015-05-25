initialization
inititializeWith: aString
	self initialize.
	elements := aString subStrings: '|'.
	"cut off leading $[ from first"
	elements at: 1 put: (elements first allButFirst).
	"cut off trailing $] from first"
	elements at: elements size put: (elements last allButLast)