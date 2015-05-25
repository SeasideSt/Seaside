visiting
visitDecoration: aDecoration
	super visitDecoration: aDecoration.
	(self shouldVisitNextPresenterOf: aDecoration)
		ifTrue: [ aDecoration next accept: self ]