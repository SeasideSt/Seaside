visiting
visitDecoration: aDecoration
	((aDecoration isKindOf: WATurboFrame) and: [ id = aDecoration id ]) ifTrue:[ 
			active := true.
			super visitDecoration: aDecoration.
			active := false. ].
	super visitDecoration: aDecoration.