*Prototype-Core
javascriptOn: aRenderer
	(aRenderer function: '$R')
		with: [
			"$R(first$, last$)"
			aRenderer argument: self first, '$'.
			aRenderer argument: self last, '$' ]