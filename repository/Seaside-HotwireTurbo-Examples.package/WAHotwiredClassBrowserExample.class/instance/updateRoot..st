rendering
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot title: 'Class Browser'.
	aRoot javascript url: WAHotwiredClassBrowserFileLibrary / #idiomorphminJs.
	aRoot meta turboRefreshMethod: 'morph'.
	aRoot meta turboRefreshScroll: 'preserve'