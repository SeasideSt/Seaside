private
requestor
	^ ((Smalltalk hasClassNamed: #UIManager)
		ifTrue: [ (Smalltalk classNamed: #UIManager) default ]
		ifFalse: [
			"can be the case for kernel image"
			Smalltalk classNamed: #FillInTheBlank ])