private callbacks
addDayCallbackToBrush: aBrush
	self hasCallback
		ifFalse: [ ^ self ].
	aBrush callback: [ :v | self day: v ]