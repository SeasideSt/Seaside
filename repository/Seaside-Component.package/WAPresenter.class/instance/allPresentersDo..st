convenience
allPresentersDo: aBlock
	(WAAllPresenterGuide client:
		(WAPluggablePresenterVisitor block: aBlock))
		start: self