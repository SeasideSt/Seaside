attributes
onTrue: trueBlock onFalse: falseBlock
	trueBlock fixCallbackTemps. falseBlock fixCallbackTemps.
	self callback: [ :v | v ifTrue: [ trueBlock value ] ifFalse: [ falseBlock value ] ]