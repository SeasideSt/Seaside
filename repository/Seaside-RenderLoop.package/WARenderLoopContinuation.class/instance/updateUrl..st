updating
updateUrl: aUrl
	super updateUrl: aUrl.
	(WAVisiblePresenterGuide client: (WAUpdateUrlVisitor url: aUrl))
		start: self presenter