convenience
resetIfPossible
	^ committed
		ifTrue: [ false ]
		ifFalse: [
			self initializeFields.
			bufferedStream reset.
			true ]