updating
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	updateRootBlock isNil
		ifFalse: [ updateRootBlock value: anHtmlRoot ]