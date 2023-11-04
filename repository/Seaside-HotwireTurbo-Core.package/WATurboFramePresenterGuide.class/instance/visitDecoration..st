visiting
visitDecoration: aDecoration

	(aDecoration isTurboFrame and: [ id = aDecoration id ])
		ifTrue: [ 
			active := true.
			super visitDecoration: aDecoration.
			active := false ]
		ifFalse: [ super visitDecoration: aDecoration ]