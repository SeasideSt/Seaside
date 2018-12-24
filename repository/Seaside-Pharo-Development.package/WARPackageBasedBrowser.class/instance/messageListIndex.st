accessing
messageListIndex
	^ selectedMethod isNil
		ifTrue: [ 0 ]
		ifFalse: [ self messageList indexOf: selectedMethod selector ]