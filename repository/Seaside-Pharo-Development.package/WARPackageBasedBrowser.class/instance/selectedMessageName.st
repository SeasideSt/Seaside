accessing
selectedMessageName
	^ selectedMethod isNil
		ifTrue: [ nil ]
		ifFalse: [ selectedMethod selector ]