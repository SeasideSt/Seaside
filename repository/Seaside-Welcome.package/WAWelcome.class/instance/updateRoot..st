updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	
	anHtmlRoot title: self title.
	anHtmlRoot link beShortcutIcon; url: WAToolFiles / #faviconIco
