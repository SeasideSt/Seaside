updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot javascript
		url: 'https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'