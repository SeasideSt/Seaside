actions
evaluate
	^ self object class compilerClass new
		evaluate: input
		in: thisContext
		to: self object