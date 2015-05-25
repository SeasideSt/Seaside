public
add: anObject
	"Add anObject to the collection of child items. Answer an instance of SUNavigationItem."

	^ items add: (self navigationItemClass on: self body: anObject)