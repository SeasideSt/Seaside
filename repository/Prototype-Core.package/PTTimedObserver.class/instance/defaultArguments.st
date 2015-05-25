defaults
defaultArguments
	^ super defaultArguments , (Array with: self frequency with: self function)