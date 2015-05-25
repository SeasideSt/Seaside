updating
toPresenterSendRoot: anHtmlRoot
	(WAVisiblePresenterGuide client:
		(WAUpdateRootVisitor root: anHtmlRoot))
		start: self presenter