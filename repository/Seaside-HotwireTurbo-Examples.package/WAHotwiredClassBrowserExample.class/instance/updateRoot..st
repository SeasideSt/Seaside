rendering
updateRoot: aRoot

	super updateRoot: aRoot.
	aRoot title: 'Class Browser'.
	aRoot javascript url: WAHotwiredClassBrowserFileLibrary / #idiomorphminJs.
	aRoot javascript
		type: 'module';
		url: WAHotwiredClassBrowserFileLibrary / #codeeditorControllerJs.
	aRoot meta turboRefreshMethod: 'morph'.
	aRoot meta turboRefreshScroll: 'preserve'