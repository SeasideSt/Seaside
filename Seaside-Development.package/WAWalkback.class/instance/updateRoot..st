updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self exceptionDescription.
	anHtmlRoot bodyAttributes addClass: 'walkback'.
	WAToolFiles default updateRoot: anHtmlRoot