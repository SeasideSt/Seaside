actions
evaluate
	^ self object class compilerClass new
		source: input;
		context: thisContext;
		receiver: self object;
		evaluate