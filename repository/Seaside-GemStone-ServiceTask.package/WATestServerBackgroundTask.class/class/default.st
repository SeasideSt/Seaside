Instance Creation
default
	^ default ifNil: [
		"enclosed in a transaction as later we abort the transaction repeatedly while we check to see 
		if the service gem has completed our task. Without a transaction the value might not be
		set as the abort will revert to it's prior unassigned state." 
		GRPlatform current doTransaction: [ default := self new ]. 
		default ]