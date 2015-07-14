accessing
upToEnd
	"answer the remaining elements in my path"
	| elements |
	elements := path.
	path := #().
	^ elements