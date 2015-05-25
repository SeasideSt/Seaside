convenience
visiblePresentersDo: aBlock
	(WAVisiblePresenterGuide client:
		(WAPluggablePresenterVisitor block: aBlock))
		start: self