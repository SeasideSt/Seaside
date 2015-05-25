running
checkMethod: aContext
	(WASlime class: aContext selectedClass includesBehaviorNamed: #WARequestHandler)
		ifTrue: [ super checkMethod: aContext ]