updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	self theme updateRoot: anHtmlRoot.
	JQUiAllFunctionalTestsLibrary default 
		updateRoot: anHtmlRoot