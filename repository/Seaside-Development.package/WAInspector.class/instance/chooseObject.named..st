actions
chooseObject: anObject named: aString
	"Choose a new object to be inspected, adding aString to the navigation path."

	path pushSegment: anObject name: aString.
	selected := nil