attributes
onTrue: trueBlock onFalse: falseBlock
	self callback: [ :v | v ifTrue: [ trueBlock value ] ifFalse: [ falseBlock value ] ]