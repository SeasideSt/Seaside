accessing
messageListIndex
	^ nautilus selectedMethod isNil
		ifTrue: [ 0 ]
		ifFalse: [ self messageList indexOf: nautilus selectedMethod selector ]