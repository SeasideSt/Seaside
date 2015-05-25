public
remove: anItem
	"Remove anItem from the collection of child items."

	^ items remove: anItem ifAbsent: [ nil ]