accessing
selectedMessageName
	^ nautilus selectedMethod isNil
		ifTrue: [ nil ]
		ifFalse: [ nautilus selectedMethod selector ]