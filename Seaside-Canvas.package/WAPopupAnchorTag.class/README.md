I am used to create a link that opens in a new window. A name can be specified using #name: and many features can be configured. Note, that not all features are supported on all web browser platforms. If Javascript is disabled the link will behave like any other anchor.

Most of the time a popup-anchor is created like this:

	html popupAnchor
		callback: [ self session presenter
			show: WACounter new ];
		with: 'Open the counter within a new window'

This code creates a new render-loop and displays a new instance of WACounter within the new browser window.		
