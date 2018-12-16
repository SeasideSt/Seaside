running
checkMethod: aContext
	(WASlime class: aContext methodClass includesBehaviorNamed: #WASession)
		ifTrue: [ super checkMethod: aContext ]