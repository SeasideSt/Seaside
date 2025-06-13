updating
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot bodyAttributes at: 'data-turbo-prefetch' put: 'false'