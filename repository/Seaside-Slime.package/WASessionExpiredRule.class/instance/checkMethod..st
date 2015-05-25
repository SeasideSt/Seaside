running
checkMethod: aContext
	(WASlime class: aContext selectedClass includesBehaviorNamed: #WASession)
		ifTrue: [ super checkMethod: aContext ]