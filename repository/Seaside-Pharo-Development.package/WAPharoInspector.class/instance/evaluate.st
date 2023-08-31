actions
evaluate
	^ self object class compilerClass new
		source: input;
		receiver: self object;
		evaluate