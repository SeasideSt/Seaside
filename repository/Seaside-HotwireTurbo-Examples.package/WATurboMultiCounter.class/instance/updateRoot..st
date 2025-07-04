hooks
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot meta turboRefreshMethod: 'morph'.
	aRoot meta turboRefreshScroll: 'preserve'