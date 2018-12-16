running
checkMethod: aContext
	(WASlime class: aContext methodClass includesBehaviorNamed: #WARequestHandler)
		ifTrue: [ super checkMethod: aContext ]